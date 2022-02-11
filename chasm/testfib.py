# this script calculates the fibonacci number
prev = 1
prevPrev = 1
result = 1 
ctr = 2
while ctr < 5:
    result = prev + prevPrev
    prevPrev = prev
    prev = result
    

    ctr += 1
    


print(result)
    


    

