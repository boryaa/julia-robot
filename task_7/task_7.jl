FLAG_MARK = true

function mark_chess!(r::Robot)
    putmarker!(r)
    num_ver = moves!(r, Sud)
    num_hor = moves!(r, Ost)

    global FLAG_MARK

    while true
        putmarkers_chess!(r, West)
        n = true
        putmarkers_chess!(r, Ost)
        n = false
        if isborder(r, Nord) == true
            if n == true
                putmarkers_chess!(r, Ost)
            else
                putmarkers_chess!(r, West)
            end
            break
        end
    end

    moves!(r, Sud)
    moves!(r, Ost)

    moves!(r, Nord, num_ver)
    moves!(r, West, num_hor)

end


function moves!(r::Robot, side::HorizonSide)
    num_steps = 0
    global FLAG_MARK
    while isborder(r, side) == false
        move!(r, side)
        if FLAG_MARK == true
            FLAG_MARK = false
        else
            FLAG_MARK = true
            putmarker!(r)
        end
        num_steps += 1
    end
    return num_steps
end

function moves!(r::Robot, side::HorizonSide, num_steps::Int)
    for i in 1:num_steps
        move!(r, side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r, side) == false
            move!(r, side)
            putmarker!(r)
    end
end

function putmarkers_chess!(r::Robot, side::HorizonSide)
    global FLAG_MARK
    while isborder(r, side) == false
        move!(r, side)
        if FLAG_MARK == true
            FLAG_MARK = false
        else
            FLAG_MARK = true
            putmarker!(r)
        end
    end
    if isborder(r, Nord) == false
        move!(r,Nord)
        if FLAG_MARK == true
            FLAG_MARK = false
        else
            FLAG_MARK = true
            putmarker!(r)
        end
    end
end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 