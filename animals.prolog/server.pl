:- use_module(library(http/thread_httpd)).
:- use_module(react_router). % the custom router


% Start the server using a custom router that will allow both api,
% static files and the react router to work together nicely.
:- http_server(react_router:route, [port(8008)]).
















