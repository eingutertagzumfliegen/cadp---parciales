program ParcialSegundaFecha;
type
	rAnios = 1980..2024;
	rAnios2 = 2010..2020;

    compra = record
        codigo: integer;
        anio: rAnios;
        monto: real;
        dniCliente: LongInt; // Cambiado a LongInt
    end;
    
    lista = ^nodo;
    nodo = record
        dato: compra;
        siguiente: lista;
    end;
    
    vContador = array[rAnios2] of real;
    
procedure cargarLista(var l: lista);
var
    nuevaCompra: lista;
begin
    // Compra 1
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 101;
    nuevaCompra^.dato.anio := 1985;
    nuevaCompra^.dato.monto := 1200.50;
    nuevaCompra^.dato.dniCliente := 20567890;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 1056;
    nuevaCompra^.dato.anio := 1985;
    nuevaCompra^.dato.monto := 2250.50;
    nuevaCompra^.dato.dniCliente := 20567890;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 2
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 102;
    nuevaCompra^.dato.anio := 1992;
    nuevaCompra^.dato.monto := 3200.00;
    nuevaCompra^.dato.dniCliente := 30892123;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 3
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 103;
    nuevaCompra^.dato.anio := 2010;
    nuevaCompra^.dato.monto := 875.00;
    nuevaCompra^.dato.dniCliente := 20334567;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 4
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 104;
    nuevaCompra^.dato.anio := 2015;
    nuevaCompra^.dato.monto := 1500.00;
    nuevaCompra^.dato.dniCliente := 30567812;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 5
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 105;
    nuevaCompra^.dato.anio := 2020;
    nuevaCompra^.dato.monto := 450.75;
    nuevaCompra^.dato.dniCliente := 20123456;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 108;
    nuevaCompra^.dato.anio := 2017;
    nuevaCompra^.dato.monto := 900.00;
    nuevaCompra^.dato.dniCliente := 35203844;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
    // Compra 6
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 106;
    nuevaCompra^.dato.anio := 2023;
    nuevaCompra^.dato.monto := 2300.50;
    nuevaCompra^.dato.dniCliente := 40987654;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
    // Compra 7
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 107;
    nuevaCompra^.dato.anio := 2018;
    nuevaCompra^.dato.monto := 3500.00;
    nuevaCompra^.dato.dniCliente := 51234567;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 8
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 108;
    nuevaCompra^.dato.anio := 2021;
    nuevaCompra^.dato.monto := 900.00;
    nuevaCompra^.dato.dniCliente := 35203844;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 1098;
    nuevaCompra^.dato.anio := 2020;
    nuevaCompra^.dato.monto := 900.00;
    nuevaCompra^.dato.dniCliente := 35203844;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 10998;
    nuevaCompra^.dato.anio := 2020;
    nuevaCompra^.dato.monto := 900.00;
    nuevaCompra^.dato.dniCliente := 61890754;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 9
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 109;
    nuevaCompra^.dato.anio := 2022;
    nuevaCompra^.dato.monto := 1500.25;
    nuevaCompra^.dato.dniCliente := 72015468;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;

    // Compra 10
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 110;
    nuevaCompra^.dato.anio := 2019;
    nuevaCompra^.dato.monto := 2800.75;
    nuevaCompra^.dato.dniCliente := 27235094;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
    new(nuevaCompra);
    nuevaCompra^.dato.codigo := 11010;
    nuevaCompra^.dato.anio := 2020;
    nuevaCompra^.dato.monto := 3800.75;
    nuevaCompra^.dato.dniCliente := 27235094;
    nuevaCompra^.siguiente := l;
    l := nuevaCompra;
    
end;

procedure insertarOrdenado(var l: lista; c: compra);
var
    actual, anterior, nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := c; // Asignar c a nuevo^.dato
    actual := l;
    anterior := nil; // Cambiado para inicializar correctamente

    while (actual <> nil) and (c.dniCliente > actual^.dato.dniCliente) do
    begin
        anterior := actual;
        actual := actual^.siguiente;
    end;

    if (anterior = nil) then // Caso para insertar al inicio
        l := nuevo
    else
        anterior^.siguiente := nuevo;

    nuevo^.siguiente := actual;
end;

procedure cargarLista2(l: lista; var l2: lista);
begin
    while l <> nil do
    begin
        if (l^.dato.anio >= 2010) and (l^.dato.anio <= 2020) then
            insertarOrdenado(l2, l^.dato); 
        l := l^.siguiente;
    end;
end;

procedure iniciarVector(var v: vContador);
var
    i: rAnios2;
begin
    for i := 2010 to 2020 do
        v[i] := 0;
end;

// Procedimiento para actualizar máximos
procedure actualizarMaximos(dni: LongInt; cantCompras: integer; var dniMax1, dniMax2: LongInt; var maxCompra1, maxCompra2: integer);
begin
    if (cantCompras > maxCompra1) then
    begin
        maxCompra2 := maxCompra1;
        dniMax2 := dniMax1;
        maxCompra1 := cantCompras;
        dniMax1 := dni;
    end
    else if (cantCompras > maxCompra2) then
    begin
        maxCompra2 := cantCompras;
        dniMax2 := dni;
    end;
end;

function aNioMenosFacturacion(v: vContador) : integer;
var
	i: rAnios2;
	facturacionMinima: real;
	anioMinimo: rAnios2;
begin
	facturacionMinima := -1;
	anioMinimo := 2010;
  
	for i := 2010 to 2020 do
    begin
        if v[i] > facturacionMinima then
        begin
            facturacionMinima := v[i];
            anioMinimo := i;
        end;
    end;
    anioMenosFacturacion := anioMinimo;
end;
// Procedimiento para procesar la lista y generar informes
procedure procesarInformar(l2: lista; var v: vContador);
var   
    cantCompras: integer;
    dniMax1, dniMax2, dniActual: LongInt;
    maxCompra1, maxCompra2: integer;   
    montoTotal: real;
begin
    maxCompra1 := -1;
    maxCompra2 := -1;
    
    
	montoTotal := 0;
    iniciarVector(v);
    
    while (l2 <> nil) do
    begin
        dniActual := l2^.dato.dniCliente;
        cantCompras := 0;
		
		
        while (l2 <> nil) and (l2^.dato.dniCliente = dniActual) do
        begin
            v[l2^.dato.anio] := v[l2^.dato.anio] + l2^.dato.monto;
            cantCompras := cantCompras + 1;
            
			if (l2^.dato.codigo mod 10 = 0) then
				montoTotal:= montoTotal + l2^.dato.monto;
				
            l2 := l2^.siguiente;
        end;
        
        actualizarMaximos(dniActual, cantCompras, dniMax1, dniMax2, maxCompra1, maxCompra2);
    end;
		anioMenosFacturacion(v);
  
	writeln('--------------------------------------------------------------');
    writeln('El año con mejor facturación es el año: ', anioMenosFacturacion(v));
    writeln('--------------------------------------------------------------');
    writeln('Los clientes que más compras hicieron fueron: ', dniMax1, ' y ', dniMax2);
    writeln('--------------------------------------------------------------');
    writeln('El monto total facturado de compras con código multiplo de 10 es: $', montoTotal:0:2);
    writeln('--------------------------------------------------------------');
end;

procedure imprimirLista(l: lista);
begin
    while l <> nil do
    begin
        writeln('Código: ', l^.dato.codigo, 
                ', Año: ', l^.dato.anio, 
                ', Monto: ', l^.dato.monto:0:2, 
                ', DNI del Cliente: ', l^.dato.dniCliente);
        l := l^.siguiente;
    end;
end;

{ Programa principal }
var
    l: lista;
    l2: lista;
    v: vContador;
begin
    l := nil;
    l2 := nil;
	cargarLista(l);
    cargarLista2(l, l2); // Procesar la lista y llenar l2       
    imprimirLista(l2);
    procesarInformar(l2, v);
end.
