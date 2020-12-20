function mark_cross!(r::Robot)

    side = West

    for _ in 1:4

        while !isborder(r, side) && !isborder(r, next(side))
            move!(r, side)
            move!(r, next(side))
            putmarker!(r)
        end

        side = inverse(side)

        while ismarker(r)
            move!(r, side)
            move!(r, next(side))
        end

        side = next(side)
    end
    putmarker!(r)
end

next(side::HorizonSide) = HorizonSide(mod(Int(side)+1,4))
