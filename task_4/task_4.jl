NUM_MARK = 0 # счётчик кол-ва клеток, которые надо замаркировать
# (отличается от фактического кол-ва клеток, которые надо замаркировать, на -1)

    function mark_triangle!(r::Robot)
    
        num_ver = moves!(r, Sud)
        num_hor = moves!(r, Ost)

        putmarker!(r)

        putmarkers!(r, West)
        flag_to_left = false #надо ли роботу поворачивать налево с перехедом наверх

        while true
        move!(r,Nord)
        putmarker!(r)
        global NUM_MARK
        NUM_MARK -= 1

    
            if flag_to_left == false
                putmarkers!(r, Ost, NUM_MARK)
                flag_to_left = true
            end
            
            move!(r, Nord)
            NUM_MARK -= 1 # с переходом на след. уровень надо ставить на 1 маркер меньше

            if flag_to_left == true
                move!(r, West)
                putmarker!(r)
                putmarkers!(r, West, NUM_MARK)
                flag_to_left = false
            end

            if isborder(r, Nord) == true
                break # если на севере перегородка, то цикл прекращается
            end
        end 
        
        moves!(r, Sud)
        moves!(r, Ost)

        moves!(r, Nord, num_ver)
        moves!(r, West, num_hor)


    end

    function putmarkers!(r::Robot, side::HorizonSide) #дополненная ф-я putmarkers!(r), 
        while isborder(r,side)==false                 #которая считает кол-во поставленных маркеров
            move!(r,side)
            putmarker!(r)
            global NUM_MARK
            NUM_MARK += 1
        end
    end


    function putmarkers!(r::Robot, side::HorizonSide, num_steps::Int) #дополненная ф-я putmarkers!(r),
        for i in 1:num_steps                     #которая выполняет putmarkers!(r) указанное кол-во раз
            move!(r,side)
            putmarker!(r)
        end
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


