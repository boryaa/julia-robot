function mark_all!(r::Robot)
    num_ver = moves!(r, Sud)
    num_hor = moves!(r, Ost)

    putmarker!(r)

    while ismarker_ahead!(r, Nord) == false
        for side in(HorizonSide(i) for i = 0:3)
                putmarkers!(r, side)
        end
    end

    moves!(r, Sud)
    moves!(r, Ost)

    moves!(r, Nord, num_ver)
    moves!(r, West, num_hor)

end

function moves!(r::Robot, side::HorizonSide)
    num_steps = 0
    while isborder(r, side) == false
        move!(r, side)
        num_steps += 1
    end
    return num_steps
end

function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    for i in 1:num_steps
        move!(r, side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide) # в функию добавлена проверка на маркер
    while ismarker_ahead!(r, side) == false
        move!(r, side)
        putmarker!(r)
    end
end

function ismarker_ahead!(r::Robot, side::HorizonSide) # проверяет, есть ли маркер в следующей клетке
    if isborder(r, side) == false
        move!(r, side)
        if ismarker(r) == false
            move!(r, inverse(side))
            return false
        else
            move!(r, inverse(side))
            return true
        end
        
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 