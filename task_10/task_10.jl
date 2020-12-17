COUNT = 0

function average_temperature!(r::Robot)

    global COUNT
    temperature = 0
    side = Ost

    while !isborder(r, Nord)
        temperature += row_temperature!(r, side)
        move!(r, Nord)
        side = inverse(side)
    end
    temperature += row_temperature!(r,side)

    average_temperature = temperature / COUNT

    return average_temperature
end

function row_temperature!(r::Robot, side::HorizonSide)

    row_temperature = 0

    while !isborder(r,side)
        row_temperature += measure!(r)
        move!(r,side)
    end
    row_temperature += measure!(r)

    return row_temperature
end

function measure!(r::Robot)
    global COUNT

    if ismarker(r)
        COUNT += 1
        return temperature(r)
    else
        return 0
    end

end
