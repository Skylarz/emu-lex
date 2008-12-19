--**********************************************************************
--$Author: Original Author Unkown. Updated for ArcEmu by Maven $
--**********************************************************************

Version = 0
Fly = 0

function outSAY(text)
 SendChatMessage(text, "SAY", nil,nil);
end
function GMAddonOnLoad()
 this:RegisterForDrag("RightButton");
addonopen = "1";
end
function GMAddon_Loaded()
UIErrorsFrame:AddMessage("GM Addon v1.2.0 loaded!", 0.0, 1.0, 0.0, 53, 2);
end

-- Binding Variables
BINDING_HEADER_GMAddon = "GM Addon";
BINDING_NAME_TOGLEADDON = "Togles GM Addon";

function GoName()
result=".appear "..ToPlayerName:GetText();    
outSAY(result);
end

function NameGo()
result=".summon "..ToPlayerName:GetText();    
outSAY(result);
end

function SearchTele()
result=".recall list "   
outSAY(result);
end

function Tele()
result=".recall port "..ZoneName:GetText(); 
outSAY(result);
end

function AddPort()
result=".recall add "..ZoneName:GetText(); 
outSAY(result);
end

function DelPort()
result=".recall del "..ZoneName:GetText(); 
outSAY(result);
end

function PortPlayer()
result=".recall PortPlayer "..ToPlayerName:GetText().." " ..ZoneName:GetText(); 
outSAY(result);
end

function TicketList()
result=".gmticket get";   
outSAY(result);
end

function TicketChan()
JoinChannelByName("gm_sync_channel", "", ChatFrame1:GetID());
UIErrorsFrame:AddMessage("Please relog if this the first time you have used this function and re-use the button. I am sorry for any inconvienence but that's the way Blizzard makes it.", 1.0, 0.0, 0.0, 53, 9);
end

function ShowTicket()
result=".gmticket getid "..TicketNumber:GetText();   
outSAY(result);
end

function DeleteTicket()
result=".gmticket delid "..TicketNumber:GetText();    
outSAY(result);
end

function RemoveItem()
result=".removeitem "..ItemNumber:GetText();    
outSAY(result);
end

function AddItem()
result=".additem "..ItemNumber:GetText();    
outSAY(result);
end

function AddItemSet()
result=".additemset "..ItemSetNumber:GetText();    
outSAY(result);
end

function SearchItem()
result=".lookupitem "..ItemNumber:GetText();    
outSAY(result);
end

function SearchSkill()
result=".lookupskill "..SkillName:GetText();    
outSAY(result);
end

function LearnSkill()
result=".learnsk "..SkillNumber:GetText().." "..SkillLevelssss:GetText().." "..SkillMax:GetText();        
outSAY(result);
end

function UnLearnSkill()
result=".removesk "..SkillNumber:GetText();    
outSAY(result);
end

function LearnBlackSmithing()
result=".learnsk 164 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnTailoring()
result=".learnsk 197 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnLeatherworking()
result=".learnsk 165 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnEngineering()
result=".learnsk 202 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnPoisons()
result=".learnsk 40 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnEnchanting()
result=".learnsk 333 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnFishing()
result=".learnsk 356 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnMining()
result=".learnsk 186 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnSkinning()
result=".learnsk 393 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnAlchemy()
result=".learnsk 171 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnHerbalism()
result=".learnsk 182 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnFirstAid()
result=".learnsk 129 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnCooking()
result=".learnsk 185 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnRiding()
result=".learnsk 762 "..SkillLevel:GetText();    
outSAY(result);
end

function AddMoney()
result = ".modify gold " ..Money:GetNumber() * 10000
outSAY(result);
end



function Announce()
result=".announce "..AnnounceText:GetText();    
outSAY(result);
end

function RaidStyleAnnounce()
result=".wannounce "..AnnounceText:GetText();    
outSAY(result);
end

function WhisperOn()
result=".allowwhispers "..PlayerName2:GetText();
outSAY(result);
end

function WhisperOff()
result=".blockwhispers "..PlayerName2:GetText();  
outSAY(result);
end

function Go()
result=".worldport "..MapID:GetText().." "..XCord:GetText().." "..YCord:GetText().." "..ZCord:GetText();
outSAY(result);
end

function LearnSpell()
result=".learn "..SpellNumber:GetText();    
outSAY(result);
end

function UnLearnSpell()
result=".unlearn "..SpellNumber:GetText();    
outSAY(result);
end

function LearnDualWield()
result=".learnsk 118 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnJewel()
result=".learnsk 755 "..SkillLevel:GetText();    
outSAY(result);
end

function LearnStaves()
result=".learnsk 136 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnUnarmed()
result=".learnsk 136 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnTwoHandedAxes()
result=".learnsk 172 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnDaggers()
result=".learnsk 173 "..WeaponSkillLevel:GetText();    
outSAY(result);
end


function LearnCrossBows()
result=".learnsk 226 "..WeaponSkillLevel:GetText();    
outSAY(result);
end


function LearnWands()
result=".learnsk 228 "..WeaponSkillLevel:GetText();    
outSAY(result);
end


function LearnPolearms()
result=".learnsk 229 "..WeaponSkillLevel:GetText();    
outSAY(result);
end


function LearnGuns()
result=".learnsk 46 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnSwords()
result=".learnsk 43 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnTwoHandedSwords()
result=".learnsk 55 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnFistWeapons()
result=".learnsk 473 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnTwoHandedMaces()
result=".learnsk 160 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnBows()
result=".learnsk 45 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnThrown()
result=".learnsk 176 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnAxes()
result=".learnsk 44 "..WeaponSkillLevel:GetText();    
outSAY(result);
end

function LearnMaces()
result=".learnsk 54 "..WeaponSkillLevel:GetText();    
outSAY(result);
end



function TargetObject()
result=".go select ";    
outSAY(result);
end

function ObjectInfo()
result=".go info ";    
outSAY(result);
end

function DeleteObject()
result=".go delete ";    
outSAY(result);
end

function PlaceObject()
result=".go spawn "..ObjectNumber:GetText();    
outSAY(result);
end

function BanPlayer()
result=".banchar "..CharName:GetText();   
outSAY(result);
end

function UnBanPlayer()
result=".unbanchar "..CharName:GetText();    
outSAY(result);
end

function KickPlayer()
result=".kick "..CharName:GetText().." "..BanReason:GetText();
outSAY(result);
end

function ParPlayer()
result=".paralyze "..CharName:GetText();    
outSAY(result);
end

function UnParPlayer()
result=".unparalyze "..CharName:GetText();    
outSAY(result);
end

function PInfo()
result=".playerinfo "..CharName:GetText();    
outSAY(result);
end

function AddItemVendor()
result=".npc vendoradditem "..NPCItemNumber:GetText();    
outSAY(result);
end

function RemoveItemVendor()
result=".npc vendorremoveitem "..NPCItemNumber:GetText();    
outSAY(result);
end

function SpawnNPC()
result=".npc spawn "..NPCNumber:GetText();    
outSAY(result);
end

function DeleteNPCbyNumber()
result=".npc delete "..NPCNumber:GetText();    
outSAY(result);
end

function DeleteNPC()
result=".npc delete";    
outSAY(result);
end

function FirstAnnounce()
firstannounce=".announce "..SetAnnounceText:GetText();    
end

function SecondAnnounce()
secondannounce=".announce "..SetAnnounceText:GetText();    
end

function ThirdAnnounce()
thirdannounce=".announce "..SetAnnounceText:GetText();    
end

function ForthAnnounce()
forthannounce=".announce "..SetAnnounceText:GetText();    
end

function FifthAnnounce()
fifthannounce=".announce "..SetAnnounceText:GetText();    
end

function SayFirstAnnounce()
outSAY(firstannounce);
end

function SaySecondAnnounce()
outSAY(secondannounce);
end

function SayThirdAnnounce()
outSAY(thirdannounce);
end

function SayForthAnnounce()
outSAY(forthannounce);
end

function SayFifthAnnounce()
outSAY(fifthannounce);
end


function TogleAddon()
if( addonopen == "1" ) then
GMAddonForm:Hide();
Mini:Hide();
addonopen = "0";
else
GMAddonForm:Show();
addonopen = "1";
end
end

function GmOutfit()
result=".additem 2586"
outSAY(result);
result=".additem 11508"
outSAY(result);
result=".additem 12064"
outSAY(result);
end

function CreateGuild()
result=".guild create "..GuildName:GetText();  
outSAY(result);
end

function LevelPlayer()
result=".mod level "..PlayerLevel:GetText();    
outSAY(result);
end

function AdvanceAll()
result=".advanceallskills "..SkillsBy:GetText();   
outSAY(result);
end

function AddSH()
UIErrorsFrame:AddMessage("Command is not available!", 1.0, 0.0, 0.0, 53, 2);
end

function NPCInfo()
result=".npc info";
outSAY(result);
end

function NPCCome()
    result=".npc come";
    outSAY(result);
end

function SInfo()
    result=".info";
    outSAY(result);
end

function Invis()
    result=".invisible";
    outSAY(result);
end

function Invince()
    result=".invincible";
    outSAY(result);
end

function BGStart()
    result=".battleground startbg";
    outSAY(result);
end

function BGForceStart()
    result=".battleground forcestart";
    outSAY(result);
end

function BGInfo()
    result=".battleground getqueue";
    outSAY(result);
end

function BGLeave()
    result=".battleground leave"
    outSAY(result);
end

function WaypointAdd()
    result=".waypoint add";
    outSAY(result);
end

function WaypointDel()
    result=".waypoint delete";
    outSAY(result);
end

function WaypointShow()
    result=".waypoint show";
    outSAY(result);
end

function WaypointHide()
    result=".waypoint hide";
    outSAY(result);
end

function CheatFlyorLand()
if (Fly == 0) then
Fly = 1
	result=".cheat fly";
	outSAY(result);
elseif (Fly == 1) then
Fly = 0
	result=".cheat land";
	outSAY(result);
end
end

function CheatGod()
	result=".cheat god";
	outSAY(result);
end

function CheatCooldown()
	result=".cheat cooldown";
	outSAY(result);
end

function CheatCasttime()
	result=".cheat casttime";
	outSAY(result);
end

function CheatPower()
	result=".cheat power";
	outSAY(result);
end

function CheatStack()
	result=".cheat stack";
	outSAY(result);
end

function CheatTriggerpass()
	result=".cheat triggerpass";
	outSAY(result);
end

function CheatStatus()
	result=".cheat status";
	outSAY(result);
end

function ModSpeed()
	result=".modify speed "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModHP()
	result=".modify hp "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModManaRageEnergy()
	if class=="DRUID" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="HUNTER" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="MAGE" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="PALADIN" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="PRIEST" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="ROGUE" then
	result=".modify energy "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="SHAMAN" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="WARLOCK" then
	result=".modify mana "..ModifyEditBox:GetText();
	outSAY(result);
	elseif class=="WARRIOR" then
	result=".modify rage "..ModifyEditBox:GetText();
	outSAY(result);
end
end

function ModHoly()
	result=".modify holy "..ModifyEditBox:GetText();
	outSAY(result);
end
function ModFire()
	result=".modify fire "..ModifyEditBox:GetText();
	outSAY(result);
end
function ModNature()
	result=".modify nature "..ModifyEditBox:GetText();
	outSAY(result);
end
function ModFrost()
	result=".modify frost "..ModifyEditBox:GetText();
	outSAY(result);
end
function ModShadow()
	result=".modify shadow "..ModifyEditBox:GetText();
	outSAY(result);
end
function ModArcane()
	result=".modify arcane "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModArmor()
	result=".modify armor "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModDamage()
	result=".modify damage "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModDisplay()
	result=".modify displayid "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModSpeed()
	result=".modify speed "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModScale()
	result=".modify scale "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModSpirit()
	result=".modify spirit "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModTP()
	result=".modify talentpoints "..ModifyEditBox:GetText();
	outSAY(result);
end

function ModFaction()
	result=".modify faction "..ModifyEditBox:GetText();
	outSAY(result);
end