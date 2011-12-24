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
-module(siv_app).

-export([start/0]).
-export([start/2, stop/1]).

-behaviour(application).

%%
%% Public API
%%
start() ->
    application:start(swedish_ivy).

%%
%% Application API
%%

start(_StartType, _StartArgs) ->
    siv_env:init(),
    siv_log:init(),
    siv_sup:start_link().

stop(_State) -> ok.
