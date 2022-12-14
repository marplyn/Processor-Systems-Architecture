module mem32_32 (       // создать блок с именем mem32_32
  input           CLK,    // вход синхронизации
  input   [4:0]   A1,      // 5-битный адресный вход
  input   [4:0]   A2,      // 5-битный адресный вход
  input   [4:0]   A3,      // 5-битный адресный вход
  input   [31:0]  WD3,     // 32-битный вход данных для записи
  input           WE3,     // сигнал разрешения на запись
  output  [31:0]  RD1,      // 32-битный выход считанных данных
  output  [31:0]  RD2      // 32-битный выход считанных данных
);

  reg [31:0] RAM [0:31];  // создать память с 32-ю 32-битными ячейками

  // чтение
  assign RD1 = (A1 == 0) ? 0 : RAM[A1];
  assign RD2 = (A2 == 0) ? 0 : RAM[A2];    // подключить к выходу RD ячейку памяти по адресу A

  // запись
  always @ (posedge CLK)  // каждый раз, когда произойдет фронт (0 → 1) CLK
    if (WE3)               // если сигнал WE3 == 1, то
      RAM[A3] <= WD3;       // в ячейку по адресу A будут записаны данные WD3

endmodule                 //  конец описания модуля