%% Copyright (c) 2011 Nebularis.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
-define(DEBUG(M), siv_log:log(debug, M)).
-define(DEBUG(M, A), siv_log:log(debug, M, A)).
-define(INFO(M), siv_log:log(info, M)).
-define(INFO(M, A), siv_log:log(info, M, A)).
-define(WARN(M), siv_log:log(warn, M)).
-define(WARN(M, A), siv_log:log(warn, M, A)).
-define(ERROR(M), siv_log:log(error, M)).
-define(ERROR(M, A), siv_log:log(error, M, A)).
