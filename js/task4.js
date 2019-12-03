var arr = [

    {value: 100, type: 'USD'},
    
    {value: 215, type: 'EUR'},
    
    {value: 7, type: 'EUR'},
    
    {value: 99, type: 'USD'},
    
    {value: 354, type: 'USD'},
    
    {value: 12, type: 'EUR'},
    
    {value: 77, type: 'USD'},
    
    ];

var euro = [];
var sum = 0;
for(var i=0;i<arr.length;i++){
    if(arr[i].type == 'USD' && arr[i].value < 100){
        sum += arr[i].value;
    }
    else if(arr[i].type == 'EUR'){
        euro.push(arr[i].value*2);
    }
};

alert(sum);
alert(euro);    
