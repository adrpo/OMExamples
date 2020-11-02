within FMUResourceExample;
package Test "Test model for FMU resource export from Modelica"
  extends Modelica.Icons.ExamplesPackage;

  import Modelica.Utilities.Files.loadResource;

protected 
  partial model OneTest
    Modelica.Blocks.Tables.CombiTable1D t_new
      annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
    Modelica.Blocks.Continuous.Der d_t_new
      annotation (Placement(transformation(extent={{0,0},{20,20}})));
    Modelica.Blocks.Sources.Clock clock
      annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  equation
    connect(t_new.y[1], d_t_new.u) annotation (Line(
        points={{-19,10},{-2,10}},
        color={0,0,127},
        thickness=0.0625));
    connect(clock.y, t_new.u[1]) annotation (Line(
        points={{-59,10},{-42,10}}, color={0,0,127}));
  end OneTest;

public
  model TestModel "ASCII Text file (Very long line length)"
    extends Modelica.Icons.Example;
    extends OneTest(t_new(
        tableOnFile=true,
        tableName="longLine",
        fileName=loadResource("modelica://FMUResourceExample/Resources/Data/Tables/test.txt"),
        columns={2,2500}));
    Modelica.Blocks.Continuous.Der d_t_new2
      annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
  equation
    t_new.u[2] = time;
    connect(t_new.y[2], d_t_new2.u) annotation (Line(
        points={{-19,10},{-14,10},{-7,10},{-7,-20},{-2,-20}},
        color={0,0,127},
        thickness=0.0625));
    annotation (experiment(StartTime=0, StopTime=1));
  end TestModel;

end Test;
