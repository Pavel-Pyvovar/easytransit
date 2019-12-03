// Pascal's triangle

var pascal3gle = [[1], [1, 1]];
window.document.write(`<p align="center">1</p>`);
window.document.write(`<p align="center">1,1</p>`);
for (var i=2;i<10;i++){
    var new_tier = [1];
    for(var j=1;j<i;j++){
        new_tier.push(pascal3gle[i-1][j-1] + pascal3gle[i-1][j]); 
    }
    new_tier.push(1);
    pascal3gle.push(new_tier);
    window.document.write(`<p align="center">${new_tier}</p>`)
};