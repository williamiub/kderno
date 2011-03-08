unit UThreadSplash;

interface

uses

  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF}, Messages, SysUtils, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,  StdCtrls, OleCtrls;

type
  TSplash = class(TThread)
  protected
    procedure Execute; override;
  end;

implementation

uses
    UMenu;

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TSplash.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ TSplash }

procedure TSplash.Execute;
begin
  NameThreadForDebugging('Splash');
  { Place thread code here }
  try
    try

    finally


    end;



  finally

  end;
end;

end.
