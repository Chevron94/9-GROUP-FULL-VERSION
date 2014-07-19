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
--  Важно:  
--  kill_target = Find_Nearest(unit, PlayerObject, false)  
--  closest_enemy = Find_Nearest(attacker, enemy_player, true)	
--  target = Find_Nearest(Object, underworld_player)

function Definitions()

	DebugMessage("%s -- In Definitions", tostring(Script))
	

	StoryModeEvents = 
	{
		Heroes_Arrive    = Meet_Heroes_fleet
		              
		}

end



function Meet_Heroes_fleet()


		star_destroyer_position_1    = Find_Hint("GENERIC_MARKER_SPACE", "star-destroyer-1")
		star_destroyer_position_2    = Find_Hint("GENERIC_MARKER_SPACE", "star-destroyer-2")
		igor_position = Find_Hint("GENERIC_MARKER_SPACE", "igor-1")
		roman_position = Find_Hint("GENERIC_MARKER_SPACE", "roman-1")
		nikita_position = Find_Hint("GENERIC_MARKER_SPACE", "nikita-1")
		tanya_position = Find_Hint("GENERIC_MARKER_SPACE", "tanya-1")
		andrei_position = Find_Hint("GENERIC_MARKER_SPACE", "andrei-1")
		
		gamer  = Find_Player("Underworld")

Sleep (1)
	

		Point_Camera_At(igor_position)
		Start_Cinematic_Camera()
		Lock_Controls(1)

		
        igorgroup = Spawn_Unit(Find_Object_Type("IGOR"), igor_position, gamer)
        igorgroup = Find_First_Object("IGOR")
        igorgroup.Teleport_And_Face(igor_position)
        igorgroup.Cinematic_Hyperspace_In(90) 

Sleep (6)
		
		End_Cinematic_Camera()  
		Lock_Controls(0)


Sleep (120)		
		
		Point_Camera_At(roman_position)
		Start_Cinematic_Camera()
		Lock_Controls(1)

		
        nikita = Spawn_Unit(Find_Object_Type("Nikita"), nikita_position, gamer)
        nikita = Find_First_Object("Nikita")
        nikita.Teleport_And_Face(nikita_position)
        nikita.Cinematic_Hyperspace_In(90) 

		roman = Spawn_Unit(Find_Object_Type("Roman"), roman_position, gamer)
        roman = Find_First_Object("Roman")
        roman.Teleport_And_Face(roman_position)
        roman.Cinematic_Hyperspace_In(90)
		
		andrei = Spawn_Unit(Find_Object_Type("Andrei"), andrei_position, gamer)
        andrei = Find_First_Object("Andrei")
        andrei.Teleport_And_Face(andrei_position)
        andrei.Cinematic_Hyperspace_In(90)
		
Sleep (6)
		
		End_Cinematic_Camera()  
		Lock_Controls(0)	
		
		
Sleep (60)
	
		Point_Camera_At(tanya_position)
		Start_Cinematic_Camera()
		Lock_Controls(1)

		
        tanya = Spawn_Unit(Find_Object_Type("Tanya"), tanya_position, gamer)
        tanya = Find_First_Object("Tanya")
        tanya.Teleport_And_Face(tanya_position)
        tanya.Cinematic_Hyperspace_In(90) 

Sleep (6)
		
		End_Cinematic_Camera()  
		Lock_Controls(0)
	
Sleep (60)
	
	Point_Camera_At(star_destroyer_position_2)
	Start_Cinematic_Camera()
	Lock_Controls(1)

	earsship_1 = Spawn_Unit(Find_Object_Type("Ears_Ship"), star_destroyer_position_1, gamer)
    earsship_1 = Find_First_Object("Ears_Ship")
    earsship_1.Teleport_And_Face(star_destroyer_position_1)
    earsship_1.Cinematic_Hyperspace_In(40)
	
Sleep (6)		

	
	earsship_2 = Spawn_Unit(Find_Object_Type("Marina"), star_destroyer_position_2, gamer)
    earsship_2 = Find_First_Object("Marina")
    earsship_2.Teleport_And_Face(star_destroyer_position_2)
    earsship_2.Cinematic_Hyperspace_In(40) 
	
	Sleep (6)
	End_Cinematic_Camera()  
	Lock_Controls(0)

sleep (999000)
end






