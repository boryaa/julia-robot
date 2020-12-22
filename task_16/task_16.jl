  function mark_all!(r::Robot)
    num = 0
    movements = []
    while !((isborder(r, Sud))&&(isborder(r, West)))
        push!(movements, get_num_movements!(r, West))
        push!(movements, get_num_movements!(r, Sud))
        num += 2
    end
    putmarker!(r)
    while !isborder(r, Ost)
        move!(r, Ost)
        putmarker!(r)
    end
    side = West
    while !isborder(r, Nord)
        extra = 1
        move!(r, Nord)
        putmarker!(r)
        while extra != 0
            extra  = full_bypass(r, side)
            putmarker!(r)
        end
        side = inverse(side)
    end
    get_num_movements!(r, West)
    get_num_movements!(r, Sud)
    while num > 0
        side = isodd(num) ? Ost : Nord
        for _ in 1:movements[num]
            move!(r, side)
        end
        num -= 1
    end
end

function full_bypass(r::Robot, side::HorizonSide)
    num_steps = 0
    while isborder(r, side)&&!isborder(r, left(side))
        move!(r, left(side))
        num_steps += 1
    end
    extra = 0
    if !isborder(r, side)
        move!(r, side)
        extra += 1
    end
    if num_steps != 0
        while isborder(r, inverse(left(side)))
            move!(r, side)
            extra += 1
        end
        for _ in 1:num_steps
            move!(r, inverse(left(side)))
        end
    end
    return extra 
end
