-module(ocr).
-export([parse/1,readlines/1,get_all_lines/2,characterize/1]).

parse(FileName) -> 
    characterize(ocr:readLines(FileName)).
    

readlines(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    ocr:get_all_lines(Device, []).

get_all_lines(Device, Accum) ->
    case io:get_line(Device, "") of
        eof  -> file:close(Device), Accum;
        Line -> ocr:get_all_lines(Device, Accum ++ [Line])
    end.

characterize([])->
    [];
characterize([[A,B,C |RestOfLine1],[D,E,F |RestOfLine2],[G,H,I |RestOfLine3]  | Rest]) ->
    [make_chars([[ A,B ,C ],[D,E,F],[G,H,I]]), make_chars([RestOfLine1,RestOfLine2,RestOfLine3]) | characterize(Rest)].

make_chars([[],[],[]])->
    {};
make_chars([[L1C1, L1C2,L1C3],[L2C1,L2C2,L2C3],[L3C1,L3C2,L3C3]])->
    {{L1C1,L1C2,L1C3},{L2C1,L2C2,L2C3},{L3C1,L3C2,L3C3}}.
    

    



