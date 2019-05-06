-----------------------------------------------------------------------------------------

--

-- main.lua

--

-----------------------------------------------------------------------------------------



-- Collision



local physics = require( "physics" )



physics.start()

physics.setGravity( 0, 25 ) 

physics.setDrawMode( "hybrid" )   



local leftWall = display.newRect( 0, display.contentHeight / 2, 1, display.contentHeight )

-- myRectangle.strokeWidth = 3

-- myRectangle:setFillColor( 0.5 )

-- myRectangle:setStrokeColor( 1, 0, 0 )

leftWall.alpha = 0.0

physics.addBody( leftWall, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )

leftWall.id = "left wall"


local theGround1 = display.newImage( "./assets/sprites/land.png" )

theGround1.x = 520

theGround1.y = display.contentHeight

theGround1.id = "the ground 1"

physics.addBody( theGround1, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )



local theGround2 = display.newImage( "./assets/sprites/land.png" )

theGround2.x = 1520

theGround2.y = display.contentHeight

theGround2.id = "the ground 2"

physics.addBody( theGround2, "static", { 

    friction = 0.5, 

    bounce = 0.3 

    } )



local landSquare = display.newImage( "./assets/sprites/landSquare.png" )

landSquare.x = 1520

landSquare.y = display.contentHeight - 1000

landSquare.id = "land Square"

physics.addBody( landSquare, "dynamic", { 

    friction = 0.5, 

    bounce = 0.3 

    } )



local theCharacter = display.newImage( "./assets/sprites/Idle.png" )

theCharacter.x = display.contentCenterX

theCharacter.y = display.contentCenterY

theCharacter.id = "the character"

physics.addBody( theCharacter, "dynamic", { 

    density = 3.0, 

    friction = 0.5, 

    bounce = 0.3 

    } )

theCharacter.isFixedRotation = true 



local dPad = display.newImage( "./assets/sprites/d-pad.png" )

dPad.x = 150

dPad.y = display.contentHeight - 80

dPad.alpha = 0.50

dPad.id = "d-pad"



local upArrow = display.newImage( "./assets/sprites/upArrow.png" )

upArrow.x = 150

upArrow.y = display.contentHeight - 190

upArrow.id = "up arrow"



local downArrow = display.newImage( "./assets/sprites/downArrow.png" )

downArrow.x = 150

downArrow.y = display.contentHeight + 28

downArrow.id = "down arrow"



local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )

leftArrow.x = 40

leftArrow.y = display.contentHeight - 80

leftArrow.id = "left arrow"



local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )

rightArrow.x = 260

rightArrow.y = display.contentHeight - 80

rightArrow.id = "right arrow"



local jumpButton = display.newImage( "./assets/sprites/jumpButton.png" )

jumpButton.x = display.contentWidth - 180

jumpButton.y = display.contentHeight - 80

jumpButton.id = "jump button"

jumpButton.alpha = 0.5

 

local function characterCollision( self, event )

 

    if ( event.phase == "began" ) then

        print( self.id .. ": collision began with " .. event.other.id )

 

    elseif ( event.phase == "ended" ) then

        print( self.id .. ": collision ended with " .. event.other.id )

    end

end



function upArrow:touch( event )

    if ( event.phase == "ended" ) then

        transition.moveBy( theCharacter, { 

        	x = 0, 

        	y = -50, 

        	time = 100 

        	} )

    end



    return true

end



function downArrow:touch( event )

    if ( event.phase == "ended" ) then

        transition.moveBy( theCharacter, { 

        	x = 0, 

        	y = 50, 

        	time = 100 

        	} )

    end



    return true

end



function leftArrow:touch( event )

    if ( event.phase == "ended" ) then

        transition.moveBy( theCharacter, { 

        	x = -50, 

        	y = 0, 

        	time = 100 

        	} )

    end



    return true

end



function rightArrow:touch( event )

    if ( event.phase == "ended" ) then

        transition.moveBy( theCharacter, { 

        	x = 50, 

        	y = 0, 

        	time = 100 

        	} )

    end



    return true

end



function jumpButton:touch( event )

    if ( event.phase == "ended" ) then
        theCharacter:setLinearVelocity( 0, -750 )

    end



    return true

end




function checkCharacterPosition( event )

    if theCharacter.y > display.contentHeight + 500 then

        theCharacter.x = display.contentCenterX - 200

        theCharacter.y = display.contentCenterY

    end

end





upArrow:addEventListener( "touch", upArrow )

downArrow:addEventListener( "touch", downArrow )

leftArrow:addEventListener( "touch", leftArrow )

rightArrow:addEventListener( "touch", rightArrow )

jumpButton:addEventListener( "touch", jumpButton )

Runtime:addEventListener( "enterFrame", checkCharacterPosition )



theCharacter.collision = characterCollision

theCharacter:addEventListener( "collision" )