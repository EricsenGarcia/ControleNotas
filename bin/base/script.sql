create table alunos(
    id Integer not null primary key,
    nome varchar(255)
);

create generator gen_aluno;

create table notas(
    id Integer not null primary key,
    id_aluno integer, 
    nota_01 Numeric(18,2),
    nota_02 Numeric(18,2),
    nota_03 Numeric(18,2),
    nota_04 Numeric(18,2)
);

Alter table notas add foreign key(id_aluno) references Alunos(id);

create generator gen_notas;