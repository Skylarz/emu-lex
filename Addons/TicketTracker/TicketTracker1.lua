--[[
--Object arrays.
local Names = {};
local Types = {};
local Views = {};
local Previous = getglobal("TicketTrackerPanel1Prev");
local Next = getglobal("TicketTrackerPanel1Next");

--Ticket arrays.
local TicketCache = {}; --All tickets.
local TicketList = {}; --Tickets ready for use in list.
local TicketNames = {}; --Tickets indexed by name.

--Ticket Stats.
local TicketCacheMax = 0;
local TicketListMax = 0;
local TicketCount = 0;
local CurrentPage=0;

--Misc.
local TicketTypes = {};
TicketTypes[0]="Stuck"; --135681
TicketTypes[1]="Harassment"; --135682
TicketTypes[2]="Guild"; --135683
TicketTypes[3]="Item"; --135684
TicketTypes[4]="Environment"; --135685
TicketTypes[5]="NPC"; --135686
TicketTypes[6]="Quest"; --135687
TicketTypes[7]="--Unused--"; --Unused
TicketTypes[8]="--Unused--"; --Unused
TicketTypes[9]="Character"; --135690 !!!

function UpdateTickets()
    TicketCache = {};
    TicketCacheMax = 0;
    TicketSize = 0;
    TicketNames={};
    SendChatMessage(".gmTicket get","SAY");
end

local TicketChannel = "gm_sync_channel";

--Functions

local function HideAll()
    for i=0,14 do
        Names[i]:Hide();
    end
    for i=15,29 do
        Types[i-15]:Hide();
    end
    for i=30,44 do
        Views[i-30]:Hide();
    end
end

local function GotoPage(id)
    start=id*15;
    finish=((id+1)*15)-1;
    i=start;
    HideAll();
    CurrentPage=id;
    if TicketListMax > finish then
        Next:Enable();
    else
        Next:Disable();
    end
    if id > 0 then
        Previous:Enable();
    else
        Previous:Disable();
    end
    while i<finish and i<TicketListMax do
        Names[i-start]:Clear();
        Names[i-start]:AddMessage(TicketList[i+1].Name);
        Names[i-start]:Show();
        Types[i-start]:AddMessage(TicketList[i+1].Category);
        Types[i-start]:Show();
        Views[i-start]:Show();
        i=i+1;
    end
end
        
local function BuildTicketList()
    --Reset everything.
    TicketList={};
    TicketListMax=0;
    --Loop through and get tickets and put them in an array.
    for i=0,TicketCacheMax do
        if TicketCache[i] ~= nil then
            --Ticket exists.
            TicketListMax=TicketListMax+1;
            TicketList[TicketListMax] = {Name=TicketCache[i].Name,Category=TicketCache[i].Category,Timestamp=TicketCache[i].Timestamp};
        end
    end
end

local function AddTicket(name,category,timestamp)
    if TicketNames[name] ~= nil then
        return;
    end
    TicketCacheMax = TicketCacheMax+1;
    TicketCache[TicketCacheMax] = {Name=name,Category=category,Timestamp=timestamp};
    TicketNames[name]=TicketCacheMax;
    TicketCount=TicketCount+1;
end

local function RemoveTicket(name)
    TicketCache[TicketNames[name] ]=nil;
    TicketNames[name]=nil;
    TicketCount=TicketCount-1;
end
--GmTicket 0,Name,Level,Type,Zone
--GmTicket 3,Name,Message
--Set up to receive ticket info.
local ORIG_ChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler;
function ChatFrame_MessageEventHandler(event)
    if event == "CHAT_MSG_CHANNEL" and arg2 == PlayerName:GetText() and arg9 == TicketChannel then
        junk,msg = strsplit(" ",arg1);
        args = {strsplit(",",msg)};
        if args[1] == "2" then
            TicketCache = {};
            TicketCacheMax = 0;
            TicketSize = 0;
            TicketNames={};
            GotoPage(CurrentPage);
        elseif args[1] == "5" then
            UpdateTickets();
        elseif args[1] == "0" then
            AddTicket(args[2],TicketTypes[args[4]-135681],0);
            BuildTicketList();
            GotoPage(CurrentPage);
        end
    end
    ORIG_ChatFrame_MessageEventHandler(event);
end

function TT_PageDown()
    GotoPage(CurrentPage-1);
end

function TT_PageUp()
    GotoPage(CurrentPage+1);
end

local function Setup()
    --Set up object arrays.
    for i=0,14 do
        Names[i]=getglobal("TicketTrackerPanel1Component"..i+1);
        Names[i]:Hide();
    end
    for i=15,29 do
        Types[i-15]=getglobal("TicketTrackerPanel1Component"..i+1);
        Types[i-15]:Hide();
    end
    for i=30,44 do
        Views[i-30]=getglobal("TicketTrackerPanel1Component"..i+1);
        Views[i-30]:Hide();
    end
    Next:Disable();
    Previous:Disable();
    SendChatMessage(".gmTicket get","SAY");
end

Setup();

SlashCmdList["TTD"]=UpdateTickets;
SLASH_TTD1 = "/ttd";

]]--