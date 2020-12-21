  function mark_kross(r)

    for side in (Nord, West, Sud, Ost)
        num_steps = putmarkers!(r, side)
        movements_if!(r, inverse(side), num_steps)
    end

    putmarker!(r)
end


function putmarkers!(r::Robot,side::HorizonSide)
    num_steps = 0 

    while move_if_possible!(r, side)
        putmarker!(r)
        num_steps += 1
    end 

    return num_steps
end


function move_if_possible!(r::Robot, direct_side::HorizonSide)::Bool

    orthogonal_side = left(direct_side)
    reverse_side = inverse(orthogonal_side)
    num_steps = 0

    if !isborder(r, direct_side)

        move!(r, direct_side)
        result = true
    else

        while isborder(r, direct_side)

            if !isborder(r, orthogonal_side)
                move!(r, orthogonal_side)
                num_steps += 1

            else
                break
            end
        end


        if !isborder(r, direct_side)

            move!(r, direct_side)

            while isborder(r, reverse_side)
                move!(r, direct_side)
            end

            result = true
        else
            result = false
        end

        if num_steps > 0
            movements_if!(r, reverse_side, num_steps)
        end

        return result
    end
end    


function movements_if!(r::Robot, side::HorizonSide, num_steps::Int64)
    for _ in 1:num_steps
        move_if_possible!(r,side) 
    end
end
