-- $Id: //depot/Projects/StarWars/Ruen/Data/Scripts/Story/Story_Empire_ActIV_M11_SPACE.luea#1 $
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
-- (C) Petroglyph Games, Inc.
--
--
--    *      *   	    ***********                 ****************        ****************     *    
--    *      *              *                           *                       *                    
--    *      *              *                           *                       *
--    *      *   *      *   *                           *                       *                    *
--    ********   *      *   *    ********   *      *    ****************        ****************     *
--    *      *   *      *   *           *   *      *                   *                       *     *
--    *      *   *      *   *           *   *      *                   *                       *     *
--    *      *   *      *   *           *   *      *                   *                       *     *
--    *      *   ********   *************   ********    ****************	****************     *                
--
--/////////////////////////////////////////////////////////////////////////////////////////////////
-- C O N F I D E N T I A L   S O ue R C E   C O D E -- D O   N O T   D I S T R I B ue T E
--/////////////////////////////////////////////////////////////////////////////////////////////////
--
--              $File: //depot/Projects/StarWars/Ruen/Data/Scripts/Story/Story_Empire_ActIV_M11_SPACE.luea $
--
--    Original Auethor: Steve_Copeland
--
--            $Auethor: Steve_Copeland $
--
--            $Change: 24062 $
--
--          $DateTime: 2005/08/17 09:44:10 $
--
--          $Revision: #1 $
--
--/////////////////////////////////////////////////////////////////////////////////////////////////

require("PGStoryMode")
require("PGStateMachine")
require("PGSpawnUnits")


--
-- 
-- 
function Definitions()

	DebugMessage("%s -- In Definitions", tostring(Script))
	

	StoryModeEvents = 
	{
		Spawn_04	= State_Spawn_04              
	}

	

		empire_shipyard_fleet =
		{
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Star_Destroyer", 
			"Victory_Destroyer",
			"Victory_Destroyer",
			"TIE_Interceptor_Squadron",
			"TIE_Interceptor_Squadron",
			"TIE_Interceptor_Squadron",
			"TIE_Interceptor_Squadron",
			"TIE_Interceptor_Squadron",
			"TIE_Interceptor_Squadron",
			"TIE_Bomber_Squadron",
			"TIE_Bomber_Squadron",
			"TIE_Bomber_Squadron",
			"TIE_Bomber_Squadron",
			"TIE_Bomber_Squadron"
		}
		
		empire_eclipse_guard =
		{
			"Eclipse_Star_Destroyer",
			"Titan_Cruiser",
			"Titan_Cruiser"
		}
		
		rebel_new_ships =
		{
			"Corellian_BattleCruiser",
			"Corellian_BattleCruiser",
			"Corellian_Destroyer",
			"Corellian_Destroyer",
			"Corellian_Destroyer",
			"Mediator_Cruiser"
		}
end



function State_Spawn_04(message)
	if message == OnEnter then
		Shipyard_pl = Find_First_Object("Empire_Shipyard")
		Hoth_pl = Find_First_Object("Hoth")
		Coruscant_pl = Find_First_Object("Coruscant")
		Empire_player = Find_Player("Empire")
		Rebel_player = Find_Player("Rebel")
		fleet5 = SpawnList(empire_shipyard_fleet, Shipyard_pl, Empire_player, true, false) 
		fleet6 = SpawnList(empire_eclipse_guard, Coruscant_pl, Empire_player, true, false) 
		fleet7 = SpawnList(rebel_new_ships, Hoth_pl, Rebel_player, true, false) 
	end
end	
