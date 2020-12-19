X = 0
Y = 0
SIZE = 0 

function mark_chess!(r::Robot, n::Int)
    global SIZE, Y, X
    SIZE = n
    num_ver = get_num_movements!(r, Sud)
    num_hor = get_num_movements!(r, West)
    mark_chess!(r)
    move_back(r, Sud, Y - num_ver)
    move_back(r, West, X - num_hor)
end

function mark_chess!(r::Robot)
    mark_row(r, Ost)
    side = West
    while !isborder(r, Nord)
        move_decart!(r, Nord)
        mark_row(r, side)
        side = inverse(side)
    end
end

function mark_row(r::Robot, side::HorizonSide)
    markers(r, X, Y, SIZE)
    while !isborder(r,side)
        move_decart!(r, side)
        markers(r, X, Y, SIZE)
    end
end
        
function markers(r::Robot, x_coord::Int, y_coord::Int, size::Int)
    if ((mod(x_coord,2*size) in 0:size-1) && (mod(y_coord,2*size) in 0:size-1))
        putmarker!(r)
    end
    if ((mod(x_coord,2*size) in size:2*size-1) && (mod(y_coord,2*size) in size:2*size-1))
        putmarker!(r)
    end
end

function move_decart!(r::Robot, side::HorizonSide)
    global X, Y
    if side == Nord
        Y += 1
    elseif side == Sud
        Y -= 1
    elseif side == Ost
        X += 1
    elseif side == West
        X -= 1
    end 
    move!(r, side)
end

function move_back(r::Robot,side::HorizonSide,num_steps::Int)
    if (num_steps < 0)
        side = inverse(side)
        num_steps *= -1
    end
    for _ in 1:num_steps
        move!(r, side)
    end
end
