UndergroundPathRoute5_Script:
	jp EnableAutoTextBoxDrawing

UndergroundPathRoute5_TextPointers:
	dw UndergroundPathEntranceRoute5Text1
	dw UndergroundPathEntranceRoute5Text2
	dw UndergroundPathEntranceRoute5Text3
	dw UndergroundPathEntranceRoute5Text4
	dw UndergroundPathEntranceRoute5Text5
	dw UndergroundPathEntranceRoute5Text6
	dw UndergroundPathEntranceRoute5Text7
	dw UndergroundPathEntranceRoute5Text8
	dw UndergroundPathEntranceRoute5Text9

UndergroundPathEntranceRoute5Text1:
	text_far _UndergroundPathEntranceRoute5Text1
	text_end

UndergroundPathEntranceRoute5Text2:
	text_far _UndergroundPathEntranceRoute5Text2
	text_end

UndergroundPathEntranceRoute5Text3:
	text_far _UndergroundPathEntranceRoute5Text3
	text_end

UndergroundPathEntranceRoute5Text4:
	text_far _UndergroundPathEntranceRoute5Text4
	text_end

UndergroundPathEntranceRoute5Text5:
	text_far _UndergroundPathEntranceRoute5Text5
	text_asm
	ld a, MUSIC_ONWARD
	call PlayMusic
	jp TextScriptEnd

UndergroundPathEntranceRoute5Text6:
	text_far _UndergroundPathEntranceRoute5Text6
	text_end

UndergroundPathEntranceRoute5Text7:
	text_far _UndergroundPathEntranceRoute5Text7
	text_end

UndergroundPathEntranceRoute5Text8:
	text_far _UndergroundPathEntranceRoute5Text8
	text_end

UndergroundPathEntranceRoute5Text9:
	text_far _UndergroundPathEntranceRoute5Text9
	text_end

