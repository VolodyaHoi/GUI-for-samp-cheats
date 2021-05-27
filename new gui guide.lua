--New project with new gui
--the menu is made for a resolution of 1366x768
-- idea - REMI
-- implemented - VolodyaHoi (vk.com/volodyahoi)
-- 26.05.2021 [reserved]


local event = require('lib.samp.events') -- Its libs
local font = renderCreateFont('Calibri', 10) -- Calibri
local keys = require 'vkeys'


ya = 768 -- initial coordinates of the menu appearance
yu = 738
yn = 740


funcac = 0xAA66CDAA -- highlighting the selected function

ffunc = 0xAA000000 

sfunc = 0xAA000000

fofunc = 0xAA000000

fifunc = 0xAA000000

tfunc = 0xAA000000
                            -- highlighting of non-selected functions
test1func = 0xAA000000

test2func = 0xAA000000

test3func = 0xAA000000

test4func = 0xAA000000

page5func = 0xAA000000

page6func = 0xAA000000

waitfunc = "FFFFFF" -- a variable with the color of a function that is not enabled (which is executed in a loop)

waitac = false -- variable for enabling / disabling a function in a loop

manuac = false -- variable for enabling / disabling main menu

cheatname = "CHEAT PROJECT ON GUI BY VOLODYAHOI" -- name main menu

num = 2 -- number of items in the main menu

page = 0 -- home page

function main()
    repeat wait(0) until isSampAvailable()


    anim = lua_thread.create_suspended(menuanim) -- menu animation xdd

    waitth = lua_thread.create_suspended(waitthread) --thread function in a loop

    anim:run() -- anim thread start


    sampAddChatMessage("{008080}GUI FOR CHEAT PROJECT LOADED!") -- Chat message

    while true do
        wait(0)
        if wasKeyPressed(0x7A) and not sampIsChatInputActive() then -- activation menu
            if menuac == false then
			    menuac = true
            else
                menuac = false
            end
		end
        if wasKeyPressed(0x26) and not sampIsChatInputActive() then -- UP
            if menuac == true then
                if page == 0 then                             -- num ~= 2 (page 0) and num ~= 7 (page 1) instead of 2 and 7, you put the number of elements on the page                                                           
                    if num ~= 2 then                            -- (without scrolling)  
                        num = num + 1
                    end  
                end
                if page == 1 then
                    if num ~= 7 then
                        num = num + 1
                    end
                end  
            end
		end
        if wasKeyPressed(0x28) and not sampIsChatInputActive() then -- DOWN
            if menuac == true then
                if page == 0 then
                    if num ~= 1 then                    -- num ~= 1 (page 0) without scrolling, you put 1 (then the maximum number of functions on the page is 7)
                        num = num - 1
                    end
                end
                if page == 1 then                       -- num ~= -1 (page 1) with scrolling, with scrolling, instead of -1, you put a number according to the formula: 
                    if num ~= -1 then                       --                                                              0 - first func in scrolled page
                        num = num - 1                                               --                                      -1 - second func in scrolled page
                    end                                                                                     --             -2 - third dunkin scrolled page
                end                                                                                     --                  and so on
            end
		end
        if wasKeyPressed(0x25) and not sampIsChatInputActive() then -- lEFT 
            if menuac == true then -- return to the main menu                                                   
			    page = 0            -- (instead of 2 in num, the number of items in the main menu)
                num = 2
            end
		end
        if wasKeyPressed(0x27) and not sampIsChatInputActive() then -- RIGHT
            if menuac == true then
                --code
            end
		end
        if wasKeyPressed(0x0D) and not sampIsChatInputActive() then -- ENTER (activation func)
            if menuac == true then
                if page == 0 then
                    if num == 2 then
                        if page == 0 then -- go to page 1 (num = 666 do not change)
                            page = 1
                            num = 666
                        end
                    elseif num == 1 then
                        sampAddChatMessage("{FFFFFF} SECOND POS!")
                    end
                end
                if page == 1 then -- activation func
                    if num == 7 then
                        sampAddChatMessage("{FFFFFF} Added HP! (no)")
                    elseif num == 6 then
                        sampAddChatMessage("{FFFFFF} Added armour! (no)")
                    elseif num == 5 then
                        sampAddChatMessage("{FFFFFF} Added dick! (what? xd)")
                    elseif num == 4 then -- activation func in loop
                        if waitac == true then
                            waitfunc = "00FFFF"
                            waitac = false
                            waitth:run() -- start thread
                        else 
                            waitfunc = "FFFFFF"
                            waitac = true
                            waitth:terminate() -- break thread
                        end
                    elseif num == 3 then
                        sampAddChatMessage("{FFFFFF} Added test2!")
                    elseif num == 2 then
                        sampAddChatMessage("{FFFFFF} Added test3!")
                    elseif num == 1 then
                        sampAddChatMessage("{FFFFFF} Added test4!")
                    elseif num == 0 then
                        sampAddChatMessage("{FFFFFF} Added test5!")
                    elseif num == -1 then
                        sampAddChatMessage("{FFFFFF} Added test6!")
                    end
                end
            end
		end

        if num == 666 then -- its need for convert num = 2 to num = 7
            num = 7
        end
        --[[
        showCursor(true)
        tposX, tposY = getCursorPos()
        renderFontDrawText(font, "" .. tposX .. ", " .. tposY .. "", tposX, tposY, 0xFFFFFFFF) -- its for get cursor pos
        ]]
        if menuac == true then
            renderDrawBoxWithBorder(523, ya, 350, 200, 0xAA000000, 1, 0xFF000000) 
            renderDrawBoxWithBorder(523, yu, 350, 30, 0xFF008080, 1, 0xFF000000) 
            renderFontDrawText(font, cheatname, 530, yn, 0xFFFFFFFF, false) 
            if page == 0 then
                cheatname = "CHEAT PROJECT ON GUI BY VOLODYAHOI"
                renderDrawBoxWithBorder(523, 530, 350, 25, ffunc, 1, 0xFF000000)
                renderDrawBoxWithBorder(523, 556, 350, 25, sfunc, 1, 0xFF000000)
                renderFontDrawText(font, "FIRST POS", 530, 535, 0xFFFFFFFF, false) 
                renderFontDrawText(font, "SECOND POS", 530, 561, 0xFFFFFFFF, false) 
            end
            if page == 1 then
                cheatname = "CHEAT PROJECT ON GUI BY VOLODYAHOI --> FIRST POS" -- changing the name of the cheat when changing page 0 to page 1
                if num > 0 then
                    renderDrawBoxWithBorder(523, 530, 350, 25, tfunc, 1, 0xFF000000)
                    renderDrawBoxWithBorder(523, 556, 350, 25, fofunc, 1, 0xFF000000)
                    renderDrawBoxWithBorder(523, 582, 350, 25, fifunc, 1, 0xFF000000)
                    renderDrawBoxWithBorder(523, 608, 350, 25, test1func, 1, 0xFF000000) 
                    renderDrawBoxWithBorder(523, 634, 350, 25, test2func, 1, 0xFF000000)
                    renderDrawBoxWithBorder(523, 660, 350, 25, test3func, 1, 0xFF000000)
                    renderDrawBoxWithBorder(523, 686, 350, 25, test4func, 1, 0xFF000000)
                    renderFontDrawText(font, "Add HP", 530, 535, 0xFFFFFFFF, false) 
                    renderFontDrawText(font, "Add armour", 530, 561, 0xFFFFFFFF, false) 
                    renderFontDrawText(font, "Add dick in ur ass", 530, 587, 0xFFFFFFFF, false)
                    --
                    renderFontDrawText(font, "{" .. waitfunc .."}Loop func", 530, 613, 0xFFFFFFFF, false)
                    renderFontDrawText(font, "Test 2", 530, 639, 0xFFFFFFFF, false)
                    renderFontDrawText(font, "Test 3", 530, 665, 0xFFFFFFFF, false)
                    renderFontDrawText(font, "Test 4", 530, 691, 0xFFFFFFFF, false)
                end
                if num < 1 then -- scroll
                    renderDrawBoxWithBorder(523, 530, 350, 25, page5func, 1, 0xFF000000)
                    renderDrawBoxWithBorder(523, 556, 350, 25, page6func, 1, 0xFF000000)
                    renderFontDrawText(font, "Test 5", 530, 535, 0xFFFFFFFF, false) 
                    renderFontDrawText(font, "Test 6", 530, 561, 0xFFFFFFFF, false) 
                end
            end

        end
        if menuac == true then
            if page == 0 then -- highlighting the selected function (page 0)
                if num ~= 2 then
                    ffunc = 0xAA000000
                end
                if num ~= 1 then
                    sfunc = 0xAA000000
                end
        
        
                if num == 2 then
                    ffunc = funcac
                elseif num == 1 then
                    sfunc = funcac
                end
    
            end
            if page == 1 then -- highlighting the selected function (page 1)
                if num == 7 then
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    tfunc = funcac
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 6 then
                    tfunc = 0xAA000000
                    fifunc = 0xAA000000
                    fofunc = funcac
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 5 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = funcac
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 4 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    test1func = funcac
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 3 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    test1func = 0xAA000000
                    test2func = funcac
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 2 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = funcac
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 1 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = funcac
                    page6func = 0xAA000000
                    page5func = 0xAA000000
                elseif num == 0 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = 0xAA000000
                    page5func = funcac
                elseif num == -1 then
                    tfunc = 0xAA000000
                    fofunc = 0xAA000000
                    fifunc = 0xAA000000
                    test1func = 0xAA000000
                    test2func = 0xAA000000
                    test3func = 0xAA000000
                    test4func = 0xAA000000
                    page6func = funcac
                    page5func = 0xAA000000
                end
            end
        end
    end
end


function menuanim()  -- main menu animation

    while true do
        wait(20)
        if menuac == true then
            if ya ~= 528 then
                ya = ya - 10
            end
            if yu ~= 498 then
                yu = yu - 10
            end
            if yn ~= 500 then
                yn = yn - 10
            end
        else
            ya = 768 
            yu = 738
            yn = 740
        end
    end
end

function waitthread() -- function in loop

    while true do
        wait(20)
        sampAddChatMessage("TEST TEST TEST", -1)
    end
end