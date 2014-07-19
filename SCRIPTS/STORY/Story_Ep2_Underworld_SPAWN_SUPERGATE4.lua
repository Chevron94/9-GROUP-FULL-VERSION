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


function Definitions()

	DebugMessage("%s -- In Definitions", tostring(Script))
	
    
	
	StoryModeEvents = 
	{
		Spawn_02				= State_Spawn_02
	}
	
	fleet_list2 = {"SUPERFLAGSHIP","SUPERFLAGSHIP","SUPERFLAGSHIP"}
end	
	


function State_Spawn_02(message)
	if message == OnEnter then
		supergate4_pl = Find_First_Object("Supergate4")
		daleks_player = Find_Player("Daleks")
		fleet2 = SpawnList(fleet_list2, supergate4_pl, daleks_player, true, false)
	elseif message == OnUpdate then
-- Do nothing
	elseif message == OnExit then
-- Do nothing
	end
end
