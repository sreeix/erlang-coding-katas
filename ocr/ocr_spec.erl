-import("ocr",[parse/1]).
-include_lib("eunit/include/eunit.hrl").

parse_simple() ->
    ocr:parse("test/xxx").
