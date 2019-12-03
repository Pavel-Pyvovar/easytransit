// How many bottles are left?

var n_bottles = prompt('Enter the number of bottles, please', 50);
for(var i=0;i<n_bottles;i++){
    alert(`${n_bottles-i} bottles are on the wall, ${i} are on the floor.`);
}
alert("No bottles left!");