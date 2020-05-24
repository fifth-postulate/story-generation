:- module(server,
          [ go/0
          ]).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_session)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_json)).
:- use_module('prolog/util.pl').

go :-
    server(8080).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

:- http_handler('/', http_reply_file('web/index.html', []), []).
 