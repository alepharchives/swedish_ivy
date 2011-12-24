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
-module(siv_log).
-export([init/0, log/2, log/3, check/1, do_log/3]).
-include_lib("annotations/include/annotations.hrl").

init() ->
    {ok, Level} = application:get_env(swedish_ivy, loglevel),
    application:set_env(swedish_ivy, loglevel, Level),
    memoize:init(?MODULE).

log(Level, Message) ->
    log(Level, Message, []).

log(Level, Message, Args) ->
    Logger = logger(rebar, rebar_log),
    Logger(Level, Message, Args).

do_log(Level, Message, Args) ->
    case check(Level) of
        true ->
            io:format("~s: " ++ Message, 
                      [get_level(Level)|Args]);
        _ ->
            ok
    end.

-memoize(ets).
logger(AppId, Mod) ->
    case application:get_all_env(AppId) of
        [] -> fun siv_log:do_log/3;
        _  -> fun(L, M, A) -> Mod:log(L, M, A) end
    end.

-memoize(ets).
get_level(Level) ->
    string:to_upper(atom_to_list(Level)).

-memoize(ets).
check(Level) ->
    {ok, Actual} = application:get_env(swedish_ivy, loglevel),
    convert(Actual) >= convert(Level).

convert(debug) -> 4;
convert(info) ->  3;
convert(warn) ->  2;
convert(error) -> 1.
