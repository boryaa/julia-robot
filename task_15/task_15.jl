function mark_frame_perimetr!(r::Robot)
    num = 0
    actions = []
    while !((isborder(r, Sud))&&(isborder(r, West)))
        push!(actions, moves!(r, West))
        push!(actions, moves!(r, Sud))
        num += 2
    end
    side = Nord
    for _ in 1:4
        while !isborder(r, side)
            putmarker!(r)
            move!(r, side)
        end
        side = inverse(left(side))
    end
    while (num > 0)
        side = isodd(num) ? Ost : Nord
        for _ in 1:actions[num]
            move!(r, side)
        end
        num -= 1
    end
end
function moves!(r::Robot, side::HorizonSide)
    num_steps = 0
    while !isborder(r, side)
        move!(r, side)
        num_steps += 1
    end
    return num_steps
end
