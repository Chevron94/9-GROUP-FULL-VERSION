-- $Id: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/SpaceMode/TacticalMultiplayerBuildSpaceUnitsGeneric.lua#5 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
-- (C) Petroglyph Games, Inc.
--
--
--  *****           **                          *                   *
--  *   **          *                           *                   *
--  *    *          *                           *                   *
--  *    *          *     *                 *   *          *        *
--  *   *     *** ******  * **  ****      ***   * *      * *****    * ***
--  *  **    *  *   *     **   *   **   **  *   *  *    * **   **   **   *
--  ***     *****   *     *   *     *  *    *   *  *   **  *    *   *    *
--  *       *       *     *   *     *  *    *   *   *  *   *    *   *    *
--  *       *       *     *   *     *  *    *   *   * **   *   *    *    *
--  *       **       *    *   **   *   **   *   *    **    *  *     *   *
-- **        ****     **  *    ****     *****   *    **    ***      *   *
--                                          *        *     *
--                                          *        *     *
--                                          *       *      *
--                                      *  *        *      *
--                                      ****       *       *
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
-- C O N F I D E N T I A L   S O U R C E   C O D E -- D O   N O T   D I S T R I B U T E
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--              $File: //depot/Projects/StarWars_Expansion/Run/Data/Scripts/AI/SpaceMode/TacticalMultiplayerBuildSpaceUnitsGeneric.lua $
--
--    Original Author: James Yarrow
--
--            $Author: James_Yarrow $
--
--            $Change: 54441 $
--
--          $DateTime: 2006/09/13 15:08:39 $
--
--          $Revision: #5 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("pgevents")


function Definitions()
	
	Category = "Tactical_Multiplayer_Build_Space_Units_Generic"
	IgnoreTarget = true
	TaskForce = {
		{
		"ReserveForce"
		,"RS_Level_Two_Starbase_Upgrade | RS_Level_Three_Starbase_Upgrade | RS_Level_Four_Starbase_Upgrade | RS_Level_Five_Starbase_Upgrade = 0,1"
		,"ES_Level_Two_Starbase_Upgrade | ES_Level_Three_Starbase_Upgrade | ES_Level_Four_Starbase_Upgrade | ES_Level_Five_Starbase_Upgrade = 0,1"
		,"US_Level_Two_Starbase_Upgrade | US_Level_Three_Starbase_Upgrade | US_Level_Four_Starbase_Upgrade | US_Level_Five_Starbase_Upgrade = 0,1"
		,"FS_Level_Two_Starbase_Upgrade | FS_Level_Three_Starbase_Upgrade | FS_Level_Four_Starbase_Upgrade | FS_Level_Five_Starbase_Upgrade = 0,1"
		,"Pirate_Fighter_Squadron | IPV1_SYSTEM_PATROL_CRAFT | PIRATE_FRIGATE = 0,2"
		,"Rebel_X-Wing_Squadron | Y-Wing_Squadron | A_Wing_Squadron | Corellian_Corvette | Corellian_Gunboat | JEDI_CRUISER_R | Marauder_Missile_Cruiser | Nebulon_B_Frigate | Alliance_Assault_Frigate | Calamari_Cruiser | Fleet_Com_Rebel_Team | B-Wing_Squadron | MC30_Frigate | Mediator_Cruiser | Corellian_Battle_Cruiser | Corellian_Destroyer | = 0,3"
		,"Tie_Fighter_Squadron | Tie_Bomber_Squadron | Tartan_Patrol_Cruiser | JEDI_CRUISER_E | Broadside_Class_Cruiser | Acclamator_Assault_Ship | Victory_Destroyer | Interdictor_Cruiser | Star_Destroyer | Fleet_Com_Empire_Team | TIE_Defender_Squadron | TIE_Interceptor_Squadron | TIE_Phantom_Squadron = 0,3"
		,"Crusader_Gunship | Interceptor4_Frigate | Kedalbe_Battleship | Krayt_Class_Destroyer | Skipray_Squadron | StarViper_Squadron | Titan_Cruiser | Eclipse_Star_Destroyer | Vengeance_Frigate = 0,3"
		,"Rogue_Squadron_Space | Sundered_Heart | Han_Solo_Team_Space_MP | Home_One = 0,1"
		,"Boba_Fett_Team_Space_MP | Accuser_Star_Destroyer | Darth_Team_Space_MP | Executor_Super_Star_Destroyer | Admonitor_Star_Destroyer = 0,1"
		,"Bossk_Team_Space_MP | IG88_Team_Space_MP | The_Peacebringer = 0,1"
		,"X-301_Squadron | F-302_Squadron | Gracefighter_Squadron | Matan | Predel  | Differencial | ALGEM | FV_Nebula | Ears_ship | Orion  | FV_Sorveign | Jumper_Squadron | FV_Type11_Squadron = 0,3"
		,"Marina | Tanya | Sasha | Igor | Nikita | Roman | Artem | Galina | ZHENYA | SESSIYA | ZACHET | EKZAMEN | SHIPYARD | HIVE | AURORA | Atlantis_SHIP | SGC_304_Carrier | SGC_304_Gunship | Andrei = 0,3"
		,"Defender | Firestar | New_Galactica | New_Pegasus | Tiger | Strikestar | Valkyrie | Talos = 0,3"
		,"CN_Viper2_Squadron | CN_Viper7_Squadron = 0,3"
		}
	}
	RequiredCategories = {"Fighter | Bomber | Corvette | Frigate | Capital | SpaceHero"}
	AllowFreeStoreUnits = false

end

function ReserveForce_Thread()
			
	BlockOnCommand(ReserveForce.Produce_Force())
	ReserveForce.Set_Plan_Result(true)
	ReserveForce.Set_As_Goal_System_Removable(false)
		
	-- Give some time to accumulate money.
	tech_level = PlayerObject.Get_Tech_Level()
	min_credits = 2000
	max_sleep_seconds = 30
	if tech_level == 2 then
		min_credits = 4000
		max_sleep_seconds = 50
	elseif tech_level >= 3 then
		min_credits = 6000
		max_sleep_seconds = 80
	end
	
	current_sleep_seconds = 0
	while (PlayerObject.Get_Credits() < min_credits) and (current_sleep_seconds < max_sleep_seconds) do
		current_sleep_seconds = current_sleep_seconds + 1
		Sleep(1)
	end

	ScriptExit()
end