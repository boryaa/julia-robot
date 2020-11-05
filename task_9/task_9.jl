function find_marker!(r::Robot)
    num_steps = 1
    while !ismarker(r::Robot)
        moves!(r, Nord, num_steps)
        moves!(r, West, num_steps)
        num_steps += 1
        moves!(r, Sud, num_steps)
        moves!(r, Ost, num_steps)
        num_steps += 1
    end


end


function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    if !ismarker(r::Robot)
        for i in 1:num_steps
            move!(r, side)
            if ismarker(r::Robot)
                break
            end
        end
    end
end