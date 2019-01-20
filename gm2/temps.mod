MODULE Temps;

FROM Fahr2C IMPORT Fahr2C;
FROM C2Fahr IMPORT C2Fahr;

FROM STextIO IMPORT WriteString, WriteLn, SkipLine;
FROM SRealIO IMPORT WriteFixed, ReadReal;

CONST Author = "Noam Kloos, 11 february 2018";

VAR
    Temp : REAL;
    Error : BOOLEAN;

BEGIN
    REPEAT
    Error := FALSE;
    WriteString("Value: ");
    ReadReal(Temp); SkipLine;

    IF (Fahr2C(Temp) <= -273.15) THEN
        WriteString("That is below absolute Zero.");
        WriteLn;
        Error := TRUE;
    END; (* IF *)

    IF NOT Error THEN
    WriteFixed(Temp,2,2);
    WriteString(" degrees Fahrenheit is ");
    WriteFixed(Fahr2C(Temp),2,2);
    WriteString(" degrees Celsius");
    WriteString(" which is "); WriteFixed(Fahr2C(Temp)+273.15,2,2);
    WriteString(" degrees Kelvin.");

    WriteLn;

    WriteFixed(Temp,2,2);WriteString(" degrees Celsius is ");
    WriteFixed(C2Fahr(Temp),2,2);WriteString(" degrees Fahrenheit");
    WriteString(" Which is ");
    WriteFixed(C2Fahr(Temp)+273.15,2,2);WriteString(" degrees Kelvin.");

    WriteLn;
    END; (* IF *)
    UNTIL NOT Error;
    END Temps.

