var answers = [];

var questions = [
    "How many children will you have in the future?\nFor example 0, 1 ,2",
    "What will be your job in the future?\nFor example Machine Learning Engineer, Web developer or DevOps",
    "Whome will you marry?\nPetya, Masha, Nobody",
    "Where will you live?\nKyiv, Kharkiv, Lviv"
];

for (var i=0;i<questions.length;i++){
    answers.push(prompt(questions[i]));
};

var res = prompt('What do you want to know about your future?');
if (res == 'Family and kids'){
    alert(`You'll get married with ${answers[2]} and you'll have ${answers[0]} kids.`);
}
else{
    alert(`You'll live in ${answers[3]} and will work as a ${answers[1]}`);
};