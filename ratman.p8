pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
function _init()

	// setup player
	
 x = 64
 y = 64
 sp = 1
 dx = 0
 dy = 0
 grid_x = 0
 grid_y = 0
 flag_tile = 0

end
-->8
function _draw()

	// clear the screen
 cls()
 // draw the map
 map(0,0,0,0,16,16)
 // draw the player
 spr(sp,x,y)
 player_animate()
 // draw x and y coordinates
	print(grid_x..","..grid_y,5,5,7)
	// draw the flag tile
	print(flag_tile,5,17)

end

-->8
function _update60()

	grid_x = flr(x/8)
	grid_y = flr(y/8)
	flag_tile = fget(mget(grid_x, grid_y))
	
	// go left  
 if btnp(⬅️) then
 	dx = dx - 1
 end
 // go right
 if btnp(➡️) then 
 	dx = dx + 1
 end
 // go up
 if btnp(⬆️) then
  dy = dy - 1
 end
 // go down
 if btnp(⬇️) then
  dy = dy + 1
 end

function hit(x,y,w,h)

	collide = false
		
	for i = x, x+w, w do
		if fget(mget(i/8,y/8))>0 or
					fget(mget(i/8, (y+h)/8))>0 then
					collide = true
		end
	end
	return collide
	
end

 if hit(x + dx, y,7.5,7.5) then
 	dx = 0
 end
 
 if hit(x, y + dy,7.5,7.5) then
 	dy = 0
 end
 
 x = x + dx
 y = y + dy
 
end



-->8
function box_hit(
	
	// values for first box
	x1, y1,
	w1, h1,
	// values for second box
	x2, y2,
	w2, h2)
	
	// boolean for if a collision is ture
	hit = false
	
	// math to check if two boxes have collided
	xs = w1 * 0.5 + w2 * 0.5
	ys = h1 / 2 + h2 / 2
	xd = abs((x1 + (w1/2)) - (x2 + (w2/2)))
	yd = abs((y1 + (h1/2)) - (y2 + (h2/2)))

	// returns true if collision occured
	if xd < xs and 
				yd < ys then
				hit = true
	end
	
	return hit
	
end

-->8
function player_animate()

	if btn(➡️) then
		sp = 17
	end
	if btn(⬅️) then
		sp = 1
	end
	if btn(⬆️) then
		sp = 49
	end
	if btn(⬇️) then
		sp = 33
	end
		
end
__gfx__
00000000550055001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000550055001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700550055001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000065700001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000855550001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700055555801111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000555f5081111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000f0f0f001111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005500550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005500550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005500550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000075700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000555580090000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000855555000aa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000805f555009a9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000f0f0f00a9aaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000057557500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000557557550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000055555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000005555000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020200020202000202000202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020000020000000200000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020000020200000202000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020000020000000002000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020000020202120202000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020202000000000000020202000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200120002000000000000021200000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020002000000000000020002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020002020202020202020002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020000000000000000000002000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0200020202020202020202020202000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0212000000000000000000000000120200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
