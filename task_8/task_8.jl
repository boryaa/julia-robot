function find_a_way!(r::Robot, side::HorizonSide)
    side_1 = HorizonSide(mod(Int(side)+1, 4))
    side_2 = HorizonSide(mod(Int(side)+3, 4))
    num_steps = 1
    while isborder(r, side) == true 
        for _ in 1:num_steps
            move!(r, side_1)
        end
        num_steps += 1
        if isborder(r, side) == false
            break
        end
        for _ in 1:num_steps
            move!(r, side_2)
        end
        num_steps += 1
        if isborder(r, side) == false
            break
        end
    end
    move!(r, side)
end

