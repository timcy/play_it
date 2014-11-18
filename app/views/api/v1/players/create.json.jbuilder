json.set! :status ,true
json.set! :status_code, 3000
json.set! :message ,"Player created successfully"
json.extract! @player ,  :id  , :first_name