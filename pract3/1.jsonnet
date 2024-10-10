local groups = ["ИКБО-%d-20" % i for i in std.range(1, 78)];
local students = [
  { age: 19, group: "ИКБО-4-20", name: "Иванов И.И." },
  { age: 18, group: "ИКБО-5-20", name: "Петров П.П." },
  { age: 18, group: "ИКБО-5-20", name: "Сидоров С.С." },
  { age: 19, group: "ИКБО-43-23", name: "Зернов Н.А." }
];

{
  groups: groups,
  students: students,
  subject: "Конфигурационное управление"
}