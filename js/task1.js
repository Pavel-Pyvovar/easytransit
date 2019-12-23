const width = document.getElementById('width');
const height = document.getElementById('height');
const frame_width = document.getElementById('frame_width');
const frame_color = document.getElementById('frame_color');
const text = document.getElementById('text');
const submit = document.getElementById('submit');
const image = document.getElementById('image');

const arr = [width, height, frame_width, frame_color, text];

function handle_event(){
    const valid = true;
    for (const item of arr){
        if(!item.checkValidity() || item.value === ''){
            item.style.border = '1px solid red';
            valid = false;
        }else{
            item.style.border = '1px solid green';
        }
    }
    
    if(valid){
        image.style.width = width.value + 'px';
        image.style.height = height.value + 'px';
        image.style.border = border.value + 'px' + color.value;
        image.setAttribute('alt', text)
    }
};

submit.addEventListener('click', handle_event)