const button = document.getElementById('addRegion');
const table = document.getElementById('table__body');

let arr = [{
    company: "Kyiv Oblast",
    income: 10_000_000
},
{
    company: "Lviv Oblast",
    income: 9_000_000
}];

const addRow = (company, income) => {
const tr = document.createElement('tr');
const td1 = document.createElement('td');
const td2 = document.createElement('td');
const td3= document.createElement('td');

td1.className = "table__delete";
td1.textContent = "Delete";
td2.textContent = `${region}`;
td3.textContent = `${population}`;
td2.setAttribute('contenteditable', 'true');
td3.setAttribute('contenteditable', 'true');

table.append(tr);
tr.append(td1);
tr.append(td2);
tr.append(td3);

const diagramBlock = document.getElementById('diagram_block');
const diagram = document.createElement('div');
const diagramWrap = document.createElement('div');
const description = document.createElement('span');
const alt = document.createElement('span');

diagramWrap.className = "diagram";
diagram.className = "diagram__column";
description.className = "diagram__description";
alt.className = "diagram__alt";

diagramBlock.append(diagramWrap);
diagramWrap.append(diagram);
diagramWrap.append(description);
diagramWrap.append(alt);

description.textContent = `${region}`;
alt.textContent = `${population}`;
diagram.style.height = `${income}px`;
diagram.style.backgroundColor = getRandomColor();

diagram.addEventListener('mouseover', () => {
    alt.style.visibility = 'visible';
});

diagram.addEventListener('mouseout', () => {
    alt.style.visibility = 'hidden';
});

td2.addEventListener('input', () => {
    description.textContent = td2.textContent;
});

td3.addEventListener('input', () => {
    diagram.style.height = td3.textContent + 'px';
    alt.textContent = td3.textContent + '$';
});

td1.addEventListener('click', () => {
    tr.remove();
    diagramWrap.remove();
})
};

button.addEventListener('click', () => {
    addRow("Kharkiv Oblast", 5_000_000);
});