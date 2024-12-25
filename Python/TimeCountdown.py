import time 

print("Countdown from 0 to 10")
for i in range(0,10+1):
  print(i)
  time.sleep(1)
seconds = time.time()
print("\nSeconds since january 1st 1970 =", seconds)	

local_time = result = time.localtime(seconds)

print("\nYear:", result.tm_year)
print("Hours:", result.tm_hour)
print("Minutes:", result.tm_min)
print("Seconds", result.tm_sec)