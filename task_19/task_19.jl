function find_marker!(r::Robot)
    num_steps = 1
    side = Nord
    while !ismarker(r)
        for _ in 1:2
            check_mark!(r, side, num_steps)
            side = left(side)
        end
        num_steps += 1
    end

end


function check_mark!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        if !ismarker(r)
            move_if_possible!(r,side)
        else
            break
        end
    end
end