function num_borders(r::Robot)
    side = Ost
    num = 0
    while !isborder(r, Nord)
        while !isborder(r, side)
            if it_is_a_border(r, side)
                num += 1
                found_it(r, side)
            end
        end
        move!(r, Nord)
        side = inverse(side)
    end
    return num
end

function it_is_a_border(r::Robot, side::HorizonSide) 
    while !isborder(r, Nord) 
        if isborder(r, side)
            return false
        end
        move!(r,side) 
    end
    return true
end

function found_it(r::Robot, side::HorizonSide)
    while isborder(r, Nord)
        move!(r,side)
    end
end

