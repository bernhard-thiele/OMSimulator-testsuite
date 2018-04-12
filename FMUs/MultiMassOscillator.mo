package MultiMassOscillator "Synthetic benchmark for parallelization using chained Mass-Spring-Damper elements"
  model System1
    Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) annotation(
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-70, 0})));
    Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(
      Placement(transformation(extent = {{20, -40}, {40, -20}})));
    Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor annotation(
      Placement(transformation(extent = {{20, -60}, {40, -40}})));
    Modelica.Mechanics.Translational.Sensors.AccSensor accSensor annotation(
      Placement(transformation(extent = {{20, -80}, {40, -60}})));
    Modelica.Mechanics.Translational.Sources.Force force annotation(
      Placement(transformation(extent = {{40, -10}, {20, 10}})));
    Modelica.Blocks.Interfaces.RealInput F annotation(
      Placement(transformation(extent = {{120, -10}, {100, 10}}), iconTransformation(extent = {{120, -10}, {100, 10}})));
    Modelica.Blocks.Interfaces.RealOutput s annotation(
      Placement(transformation(extent = {{100, -40}, {120, -20}}), iconTransformation(extent = {{100, -40}, {120, -20}})));
    Modelica.Blocks.Interfaces.RealOutput v annotation(
      Placement(transformation(extent = {{100, -60}, {120, -40}}), iconTransformation(extent = {{100, -60}, {120, -40}})));
    Modelica.Blocks.Interfaces.RealOutput a annotation(
      Placement(transformation(extent = {{100, -80}, {120, -60}}), iconTransformation(extent = {{100, -80}, {120, -60}})));
    MultiMassOscillator.Components.SDMChain sDMChain(n = 5) annotation(
      Placement(visible = true, transformation(origin = {-34, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(accSensor.flange, sDMChain.flange_b) annotation(
      Line(points = {{20, -70}, {-8, -70}, {-8, 0}, {-24, 0}, {-24, 0}}, color = {0, 127, 0}));
    connect(speedSensor.flange, sDMChain.flange_b) annotation(
      Line(points = {{20, -50}, {-8, -50}, {-8, 0}, {-24, 0}, {-24, 0}}, color = {0, 127, 0}));
    connect(positionSensor.flange, sDMChain.flange_b) annotation(
      Line(points = {{20, -30}, {-8, -30}, {-8, 0}, {-24, 0}, {-24, 0}}, color = {0, 127, 0}));
    connect(sDMChain.flange_b, force.flange) annotation(
      Line(points = {{-24, 0}, {20, 0}, {20, 0}, {20, 0}}, color = {0, 127, 0}));
    connect(fixed.flange, sDMChain.flange_a) annotation(
      Line(points = {{-70, 0}, {-46, 0}, {-46, 0}, {-44, 0}}, color = {0, 127, 0}));
    connect(accSensor.a, a) annotation(
      Line(points = {{41, -70}, {110, -70}}, color = {0, 0, 127}));
    connect(speedSensor.v, v) annotation(
      Line(points = {{41, -50}, {110, -50}}, color = {0, 0, 127}));
    connect(positionSensor.s, s) annotation(
      Line(points = {{41, -30}, {110, -30}}, color = {0, 0, 127}));
    connect(force.f, F) annotation(
      Line(points = {{42, 0}, {110, 0}}, color = {0, 0, 127}));
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false)),
      Diagram(coordinateSystem(preserveAspectRatio = false)));
  end System1;

  model System2
    Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) annotation(
      Placement(transformation(extent = {{80, -10}, {100, 10}})));
    Modelica.Mechanics.Translational.Components.SpringDamper springDamper_coupling(c = 1e6, d = 14.1421, s_rel0 = 0) annotation(
      Placement(transformation(extent = {{-10, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput F annotation(
      Placement(transformation(extent = {{-100, -10}, {-120, 10}})));
    Modelica.Blocks.Interfaces.RealInput s annotation(
      Placement(transformation(extent = {{-120, -40}, {-100, -20}})));
    Modelica.Blocks.Interfaces.RealInput v annotation(
      Placement(transformation(extent = {{-120, -60}, {-100, -40}})));
    Modelica.Blocks.Interfaces.RealInput a annotation(
      Placement(transformation(extent = {{-120, -80}, {-100, -60}})));
    Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
      Placement(transformation(extent = {{-20, 10}, {-40, -10}})));
    Modelica.Mechanics.Translational.Sources.Move move annotation(
      Placement(transformation(extent = {{-68, -10}, {-48, 10}})));
    MultiMassOscillator.Components.MSDChain mSDChain(n = 5)  annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(mSDChain.flange_b, fixed.flange) annotation(
      Line(points = {{52, 0}, {90, 0}, {90, 0}, {90, 0}}, color = {0, 127, 0}));
    connect(springDamper_coupling.flange_b, mSDChain.flange_a) annotation(
      Line(points = {{10, 0}, {32, 0}, {32, 0}, {32, 0}}, color = {0, 127, 0}));
    connect(forceSensor.f, F) annotation(
      Line(points = {{-22, 11}, {-90, 11}, {-90, 0}, {-110, 0}}, color = {0, 0, 127}));
    connect(s, move.u[1]) annotation(
      Line(points = {{-110, -30}, {-80, -30}, {-80, -1.33333}, {-70, -1.33333}}, color = {0, 0, 127}));
    connect(v, move.u[2]) annotation(
      Line(points = {{-110, -50}, {-80, -50}, {-80, 0}, {-70, 0}}, color = {0, 0, 127}));
    connect(a, move.u[3]) annotation(
      Line(points = {{-110, -70}, {-80, -70}, {-80, 1.33333}, {-70, 1.33333}}, color = {0, 0, 127}));
    connect(forceSensor.flange_a, springDamper_coupling.flange_a) annotation(
      Line(points = {{-20, 0}, {-15, 0}, {-10, 0}}, color = {0, 127, 0}));
    connect(move.flange, forceSensor.flange_b) annotation(
      Line(points = {{-48, 0}, {-44, 0}, {-40, 0}}, color = {0, 127, 0}));
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false)),
      Diagram(coordinateSystem(preserveAspectRatio = false)));
  end System2;

  model CoupledSystem
    extends Modelica.Icons.Example;
    System1 system1 annotation(
      Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
    System2 system2 annotation(
      Placement(transformation(extent = {{10, -10}, {30, 10}})));
  equation
    connect(system2.F, system1.F) annotation(
      Line(points = {{9, 0}, {-9, 0}}, color = {0, 0, 127}));
    connect(system1.s, system2.s) annotation(
      Line(points = {{-9, -3}, {-9, -3}, {9, -3}}, color = {0, 0, 127}));
    connect(system1.v, system2.v) annotation(
      Line(points = {{-9, -5}, {-9, -5}, {9, -5}}, color = {0, 0, 127}));
    connect(system1.a, system2.a) annotation(
      Line(points = {{-9, -7}, {-9, -7}, {9, -7}}, color = {0, 0, 127}));
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false)),
      Diagram(coordinateSystem(preserveAspectRatio = false)));
  end CoupledSystem;

  model ReferenceSystem
    extends Modelica.Icons.Example;
    Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) annotation(
      Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-90, 0})));
    Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(
      Placement(transformation(extent = {{80, -10}, {100, 10}})));
    Modelica.Mechanics.Translational.Components.SpringDamper springDamper_coupling(c = 1e6, d = 14.1421, s_rel0 = 0) annotation(
      Placement(transformation(extent = {{-10, -10}, {10, 10}})));
    Components.SDMChain sDMChain(n = 5) annotation(
      Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
    MultiMassOscillator.Components.MSDChain mSDChain(n = 5)  annotation(
      Placement(visible = true, transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(mSDChain.flange_b, fixed1.flange) annotation(
      Line(points = {{52, 0}, {90, 0}, {90, 0}, {90, 0}}, color = {0, 127, 0}));
    connect(springDamper_coupling.flange_b, mSDChain.flange_a) annotation(
      Line(points = {{10, 0}, {32, 0}, {32, 0}, {32, 0}}, color = {0, 127, 0}));
    connect(fixed.flange, sDMChain.flange_a) annotation(
      Line(points = {{-90, 0}, {-60, 0}}, color = {0, 127, 0}));
    connect(sDMChain.flange_b, springDamper_coupling.flange_a) annotation(
      Line(points = {{-40, 0}, {-10, 0}}, color = {0, 127, 0}));
    annotation(
      Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -20}, {100, 20}})),
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -20}, {100, 20}})));
  end ReferenceSystem;

  package Components
    model SpringDamperMass
      import SI = Modelica.SIunits;
      parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) = 1e4 "Spring constant";
      parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 2 "Damping constant";
      parameter SI.Mass m(min = 0, start = 1) = 1 "Mass of the sliding mass";
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Modelica.Mechanics.Translational.Components.Mass mass1(s(fixed = true, start = 1), v(fixed = true, start = 0), L = 0, m = m) annotation(
        Placement(transformation(extent = {{0, -10}, {20, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(s_rel0 = 0, c = c, d = d) annotation(
        Placement(transformation(extent = {{-24, -10}, {-4, 10}})));
    equation
      connect(springDamper1.flange_b, mass1.flange_a) annotation(
        Line(points = {{-4, 0}, {0, 0}}, color = {0, 127, 0}));
      connect(mass1.flange_b, flange_b) annotation(
        Line(points = {{20, 0}, {100, 0}}, color = {0, 127, 0}));
      connect(springDamper1.flange_a, flange_a) annotation(
        Line(points = {{-24, 0}, {-100, 0}}, color = {0, 127, 0}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Bitmap(extent = {{-98, -66}, {98, 48}}, fileName = "modelica://ParallelBenchmark/../../../../../tmp/springdampermass.png", imageSource = "iVBORw0KGgoAAAANSUhEUgAAAO8AAACNCAIAAADQLrq/AAAAA3NCSVQICAjb4U/gAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAP4klEQVR4nO3da1AUVxoG4LflIhpwEAVRriooeDdmBYOJJoVyCQaj0RgqJpbrbhRMka2Y2jIxKosriSyrxqo1hWFjyhiTWIiWJMTVQnbzQyy1FrwEKQUvWWM0IKJGEBi+/TEtA8MwDEPP9KHne4ofM92nu8+ZeedwprunWyIiMKYJ/dSuAGOK4TQz7eA0M+3gNDPt4DQz7eA0M+0QNM3x8ZAk419oKBYvxvnzaleLiU35NJeVQZIwe7YCq1q1CunpWL0aY8fi228RFYXDhxVYrf0sXoz589WuhBNzVXBdRKisxKNHGDYMPj4KrHDLFnh6yo8rKjB3LlauRGwsBgxQYOW9Z2hvQAC8vNDSgoICFBTghRfUrpYTM9M3l5fjhRfg4wNfXyxahOvXAeDYMUgS8vOxeDF8fTFuHLKy0NoKAI2NkCR88AGeeQaRkaitxa1bGDHCOCszExs3IjIS3t545RXcvi1vqLERb7+N0FAEBmLVKqxcacxuZ5GReO89/PwzPv9cnlJXh7Q0BAXBwwPh4di0Sa5PSwskCevWYeVKjBiBkSPx4YeorkZcHLy9MWoU9u6V12ChUQCIsGsXpk3DE09g8mTs3g3DYVOT9p48iZwceHpi8WK0tPTqzWC9RR398gv5+JC/P6Wm0tKl5OZGUVFEREePEkAuLrR8OR08SO++S5JE6elERA0NBBBAwcGUlkY//kgApaUZZ3l5UUoKlZRQTg4B9PLLREStrRQXR5JEKSmUnk5+fgTQE0/I1YiLI4Du3+9Qt2vXCKA//lF+On8+ubjQggW0Zg098wwBtG0bEVFzs1yfdeuouJgSEgigQYNo+3YqKqKpU8nVlW7c6KZRRLR+PQE0dy79+c8UFUUAbd5spr1VVXTuHO3fT/v3E0DJycTUYprmb74hgHbulJ++8w5Nm0b37slv/OzZ1Noqz0pNJTc3unZNfnd9fam+nujxm90+zSNHUnOzvFR0NPn7ExH9618E0EcfydMrKkiSuklzUxNJEj33HBFRYyMNHUorV8qz9HoaOJAWLiR6nOann5ZnHT9OAC1fLj/95BMC6PvvichSo65fJ3d3WrHCuP7YWHJ3p4YG0/Z2eDU5zaoyHTeHhQHA9u0AEBuL7GxIknHuvHnGp/Pm4R//QGkpXnxRLjxokPnuPyYGro+3ExCAS5cAoLgYAF57TZ4eEYFp01BRYe2/lP798euvANDQgPPn8Z//4OHDDv/ox42TH/j7d3g6bBgANDd30ygiNDVh+HAcPCjPCglBUxOuXkVoaDftZWoxTfPUqdi7F+vWYdUqAAgLw9q1WL5cnjtkiLHk0KEA8NNP8lNv7y63odOZmXj1KgD4+RmnDBvWTZp/+QVECA+XnxYV4d13UVGB1laMGWP8wBi4uFh62p7ZRhk+GJmZpoWrquQ0W2gvU4uZb4EpKaiqwtmz+PhjDByI3/8ex47Js27dMhb73/8AICDg8Yp6uK/PsGBNjXFK+8dmffcdAEydCgAXLyIxESEhOHwY9+6hshJeXj2rQBuzjTJUr6QERB3+2nZZ9LS9zAFM35MPPoAk4cwZTJyIt95CTg4AVFbKc/ftk/9Ht7YiLw8uLoiOtnHDM2fKKzSorsbp05bKX7qEzZsxYgTeeAMASkoA4E9/QmIivLxQUYG6OhtrYrZR0dHo1884zCDCnDnw9saDBzZuhTmA6UjjxRexeTOWLEFSEohQWAhPT8TH48oVACgrQ0wMnnsOJ07ghx/w1lsIDUVjoy0bTk7GzJlYswZnz8LXF19+CRcXuLt3KPPee3B3h16PqiocPw69Hl9/Le9sfvJJuUB5Oe7cQV4eAJw+ja++wssv96wmZhsFYPVqbNuGK1cwfjxKS1FcjL/+FZ6eNraXOYBp3/y73yE/HzodPv0Ue/di7FgUF2P0aHluVhZ8fZGbi1u3kJmJrVt7vD1XV3lsKkn47jssX46iIhw8iLQ0LF2K4cM7FN6xAzk52LYNZWWIi8PJk5g3T541fTp270Z9Pdavx9Gj2LIFhw5h+HCcPdt9HXQ6eHgYn3bVqK1b8be/oaoK27bh9m3k5mLt2h63lzmUlfs+DDuz9u1TbGfK2bOUmUmXLxunREdTfLxi67eG4o1i6lLyyHaPDBiADRtQVoaPPsLQofj8c5SW4quv1KoO0wLV0hwWhp078fbbyM+Xp/zhD1i4UK3qMC2QSNXfbP/6K86cQUsLIiONo3PGbKNymhlTEB8DYIr57DNIkpp7MDnNTBk1NcjOVrkOfSDNUvvznoRfrRM6ehQzZyIwsAcnjdmJ6GnmKFvJ2xtvvIG//x0TJ8LHB8nJqK3Fxx9jwgR4euLZZ/Hjj3LJpiZs3IgxY+DhgREj8MoruHxZnnXlCl57DQEB8PREdDS+/da4fguz+vfHhAlYtsz04JcK1N7hbUlb9ZStp51Wqy6djtzcaOFCOn6ctm4lgAYPpuhoOnKEvvySXF3pySflkmlpBNCMGbR6Nc2fT+7uNHIk6fV07x6FhNCAAbRoEa1YQf7+5OJCp04RkaVZ7c2aRQA1NDi04e0J/XZymq2n09HQoXKSWlspIIAA+vlnee6sWSRJ1NhIej2Fhpr+QAGgy5fp++8JoHfekacXFtLkyfTJJ0RkaVZ7qqdZtaMn3ZIk495DImr/VMDViiAiQj7/RJIQGIiWFuO//sBAEKG5Gf37yyeQEeHqVfz3v/jhBwBobkZoKFxc8M03CA7GnDlISDCe/mphllBEHzcz65n8IsG1i57q5Ek8+yx0OowcifR03L0rTx87FocPw88P6ekYNw7BwcjMxJ073cwSiqBp7txlGvpRMVfbh/z0E2Ji0NyM3btRW4vr17FkiXFuQgJOn8bNmzhwAHPmYP16LF3a/SxxCJpmZifFxdDrsXQpFiyAjw+am/HvfwMAEbKyIEnYtw/+/njpJfzzn/Dzw8WLACzNEoqI4+auxrK9HOZqaYhss+nT4eqKLVtw8ybc3FBQgAsXACAjAytWwMMDq1ejqAg+Pjh5ErdvIzUVAJKT8Ze/mJ8lFO6bnWuwERmJggIMHoycHHz9NeLjcfUqlixBZSUCA1FUhEmTUFiITz/Fo0fYuRPr1wPAuHFdzhKKcN1Vtz2obV2s5aU0320/eIAzZ/D003BzU7sq9iTcu6hKmm1eLROKWCMNayJlw8CAk+okxEqzipxq9KxVAqXZTj0od8zOQ5k9dJZ7NcXDZKcj0t12z/ypEJxi+5u7eqet/PctSMdseb+HEjVidmT3kYadxqM8zGWdCTFuFqRjZn2dI9LM3TNzDPXP0+COuZeioqJGi3otkjt37lRVVV0yXIDe/hyUZrvuhXCS1Frm7e09ePBgtWvRQV1d3R3HngStct/MHbOydDqdzuytDByrvr6+vr7e8dt1XJq5e3aYQarekeXevXtqbVrNvpk7ZvsZNGiQp4W7L9rBgwcPVMyxgUPTzN2z4zkm0w/EuIOGan0zd8wOM3DgQPut/OHDh/ZbeU85Os3cPatlgB3uTt7Q0KD4OntDnb6ZO2a1eLS/40svNAp5L6Mu0yxt7OYwG220MTfaODRo8+tjvxfWSv379+/N4o8ePVKqJmb15vVRp2+2Uw/q4I7Zwsva7VuiOneTu9lZoampyR416czmF1b9I9tMRW5ubgBcLNy3GdDr9QCa29+aXFScZgYA/czdabm1tdXxNekNTjMzavvi0Ue/TLvaPMJzwrMxOzR5Q3eFbX5he7jgdEy3bUMOo+y3CAtrc7X9q3e7j6+TJLtDk4XZpxFVFNWj8pY2badv5z1pUd/bp8FE0+eGyGZxmpm810IDNJvmjIwMw4MNG7ob4TKt0Gya29gv1uIfIumWmHuRbX5hu0yzvY+vOp4h1kpl2vYD+2K8sA47sNdTvXl9tN83m+ARiL1PtFCR06W5jbPF2nD2pmjncCrLQWl2/A7pjRs3WlkyIyND24EW6oR6u3LcFQgcs6E2bV1vV7SdYDz+dZMgv3FyDKcbaWg+xAaq/+BUFU6RZidJcBvnjDK0nWZnCzHUuyyLIDSbZmeL8t27d++23WTYWSl/K3atcoY29nVCXL+ZMUVwmpl2cJqZdnCamXZwmpl2cJqZdnCamXZwmpl2OPRYYN+6UAEfK+lzHH1ku6SkxMFbbG/27NmcUQ3jkQbTDk6z9pWWlkqSlJWVFRISEhQUlJubu2bNGj8/v6CgoAMHDthjQbVwmp3FmTNniouLk5KS3nzzzZqamtLS0lmzZqWmphLRb7/9drGj6upqaxZUsTlmcZqdxdq1a0ePHp2UlGR4PGrUqISEhFu3bun1+hMnTkR2lJiYaM2CqjWmC5o9v5mZGDJkCB5feLz9YwCxsbEWOloLC4qG+2aGY8eOSR1FRESoXSlbcN/MEB0dfe7cufZTbLgrigg4zQyenp4TJkxQuxYKUOyXVFaWVP3oic3LCvgVvpdaWlrOnz8/adIkszc9sceC9qZM32zlOy3CkW3thdJmrq6uU6ZMceSC9ibWZ4ux3uA0M+3gb4GsBwS/sCqnmdlCzFjzSIP1SkZGRreXY3UY7puZAgTpqjnNTEnqxppHGn2VpAbrq6fK8MOhVwoU4eiJ9fg4S2fWZFTFwYZDRxqcDw0TYecGj5tZr4gQ4jacZmYLoULchtPMekbMHBvw9eKZdvAeOqYdnGamHZxmph2cZqYd4qa5uro6MTFRp9OFh4fn5eUpWJhplaBpvn//fkxMzO3btzdt2jR16tQVK1YcOXJEkcJMwwTd37xr167a2try8nI/P7/U1NTy8vKCgoKZM2eaXPYBwOjRo/fs2dO5cFxcnCo1ZyoSNM1lZWVhYWF+fn4AXFxcKisrDRNnzJhhUnLPnj1mCzMnJGiam5qaOl+rYcqUKWaP9RQWFop2YQemCkFDMHHixKqqqtraWgBENHny5OTk5LKyss5n3H7xxRdmC6vdAqYCQY9s19TUhIeHR0RELFu27NSpU3l5efn5+XPnzi0rKzMpOWbMmH79+nUuvGDBAlVqztREorpw4cLzzz/v5eUVFhaWm5urYGGmVYL2zYzZQNBxM2M24DQz7eA0M+3gNDPt4DQz7egDaT59+rQkSXfv3lWwJNOkPpBmxqwkaJqJKCcnJygoKDg4ePv27YqUZNqn8tGbLuTn57u7u+/YsePQoUPBwcEA6urqelmSaZ6gaU5OTk5JSTE8zs7ONmR0//79Jh/FgoICsyXVqzhTk6AjjRs3bowaNcrw+KmnnjI8SEpKutlRfHy82ZLMOQl6fnNgYOC1a9cMj2/evGl4UFhYuGjRovbFCgoKzJZkzknQNL/++uuvvvpqTExMSEjIunXrDBMNfXP7Yt7e3kTUuSRzUmoPdcxrbW3Nzs4OCAgICAh4//33x48fX19f38uSTPP4jFCmHYJ+C2TMBpxmph2cZqYd/wcJCQ/iFZA2PAAAAABJRU5ErkJggg==")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end SpringDamperMass;

    model SDMChain "Spring-dampler-mass chain"
      import SI = Modelica.SIunits;
      parameter Integer n = 1 "Number of chained mass-damper components";
      parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) = 1e4 "Spring constant";
      parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 2 "Damping constant";
      parameter SI.Mass m(min = 0, start = 1) = 1 "Mass of the sliding mass";
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Components.SpringDamperMass springDamperMass[n](each c = c, each d = d, each m = m) annotation(
        Placement(transformation(extent = {{-40, -40}, {40, 40}})));
    equation
      connect(flange_a, springDamperMass[1].flange_a);
      connect(flange_b, springDamperMass[n].flange_b);
      for i in 2:n loop
        connect(springDamperMass[i - 1].flange_b, springDamperMass[i].flange_a);
      end for;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Bitmap(origin = {2, -24}, extent = {{-90, -42}, {84, 72}}, fileName = "modelica://ParallelBenchmark/../../../../../tmp/springdampermass.png", imageSource = "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"), Text(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-76, 100}, {80, 44}}, textString = "n=%n"), Text(lineColor = {0, 0, 255}, extent = {{-160, 148}, {140, 108}}, textString = "%name"), Text(origin = {-6, -44}, extent = {{-148, -22}, {152, -52}}, textString = "c=%c"), Text(origin = {-6, -72}, extent = {{-148, -22}, {152, -52}}, textString = "d=%d"), Text(origin = {-6, -100}, extent = {{-148, -22}, {152, -52}}, textString = "m=%m")}),
        Diagram(coordinateSystem(preserveAspectRatio = false), graphics = {Text(extent = {{-42, -38}, {40, -58}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.None, textString = "n=%n")}));
    end SDMChain;

    model MassSpringDamper
      import SI = Modelica.SIunits;
      parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) = 1e5 "Spring constant";
      parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 6.3246 "Damping constant";
      parameter SI.Mass m(min = 0, start = 1) = 1 "Mass of the sliding mass";
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Modelica.Mechanics.Translational.Components.Mass mass1(L = 0, m = m, s(fixed = true, start = 2), v(fixed = true, start = 0)) annotation(
        Placement(visible = true, transformation(extent = {{-28, -10}, {-8, 10}}, rotation = 0)));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(s_rel0 = 0, c = c, d = d) annotation(
        Placement(visible = true, transformation(extent = {{8, -10}, {28, 10}}, rotation = 0)));
    equation
      connect(springDamper1.flange_b, flange_b) annotation(
        Line(points = {{28, 0}, {98, 0}, {98, 0}, {100, 0}}, color = {0, 127, 0}));
      connect(flange_a, mass1.flange_a) annotation(
        Line(points = {{-100, 0}, {-28, 0}, {-28, 0}, {-28, 0}}, color = {0, 127, 0}));
      connect(mass1.flange_b, springDamper1.flange_a) annotation(
        Line(points = {{-8, 0}, {8, 0}, {8, 0}, {8, 0}}, color = {0, 127, 0}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Bitmap(origin = {25, -46}, extent = {{-113, 90}, {61, -10}}, imageSource = "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")}),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end MassSpringDamper;

    model MSDChain "Mass-spring-damper chain"
      import SI = Modelica.SIunits;
      parameter Integer n = 1 "Number of chained mass-damper components";
      parameter SI.TranslationalSpringConstant c(final min = 0, start = 1) = 1e5 "Spring constant";
      parameter SI.TranslationalDampingConstant d(final min = 0, start = 1) = 6.3246 "Damping constant";
      parameter SI.Mass m(min = 0, start = 1) = 1 "Mass of the sliding mass";
      Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b "Right flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{90, -10}, {110, 10}})));
      Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a "Left flange of compliant 1-dim. translational component" annotation(
        Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      Components.MassSpringDamper massSpringDamper[n](each c = c, each d = d, each m = m) annotation(
        Placement(transformation(extent = {{-40, -40}, {40, 40}})));
    equation
      connect(flange_a, massSpringDamper[1].flange_a);
      connect(flange_b, massSpringDamper[n].flange_b);
      for i in 2:n loop
        connect(massSpringDamper[i - 1].flange_b, massSpringDamper[i].flange_a);
      end for;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-76, 100}, {80, 44}}, textString = "n=%n"), Text(lineColor = {0, 0, 255}, extent = {{-160, 148}, {140, 108}}, textString = "%name"), Text(origin = {-6, -44}, extent = {{-148, -22}, {152, -52}}, textString = "c=%c"), Text(origin = {-6, -72}, extent = {{-148, -22}, {152, -52}}, textString = "d=%d"), Text(origin = {-6, -100}, extent = {{-148, -22}, {152, -52}}, textString = "m=%m"), Bitmap(origin = {-1, -9}, extent = {{-91, 55}, {95, -53}}, imageSource = "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")}),
        Diagram(coordinateSystem(preserveAspectRatio = false), graphics = {Text(extent = {{-42, -38}, {40, -58}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.None, textString = "n=%n")}));
    end MSDChain;
  end Components;

  package DualMassOscillator
    model System1
      Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-70, 0})));
      Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, s(fixed = true, start = 1), v(fixed = true, start = 0), L = 0) annotation(
        Placement(transformation(extent = {{-14, -10}, {6, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 1e4, d = 2, s_rel0 = 0) annotation(
        Placement(transformation(extent = {{-50, -10}, {-30, 10}})));
      Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(
        Placement(transformation(extent = {{20, -40}, {40, -20}})));
      Modelica.Mechanics.Translational.Sensors.SpeedSensor speedSensor annotation(
        Placement(transformation(extent = {{20, -60}, {40, -40}})));
      Modelica.Mechanics.Translational.Sensors.AccSensor accSensor annotation(
        Placement(transformation(extent = {{20, -80}, {40, -60}})));
      Modelica.Mechanics.Translational.Sources.Force force annotation(
        Placement(transformation(extent = {{40, -10}, {20, 10}})));
      Modelica.Blocks.Interfaces.RealInput F annotation(
        Placement(transformation(extent = {{120, -10}, {100, 10}}), iconTransformation(extent = {{120, -10}, {100, 10}})));
      Modelica.Blocks.Interfaces.RealOutput s annotation(
        Placement(transformation(extent = {{100, -40}, {120, -20}}), iconTransformation(extent = {{100, -40}, {120, -20}})));
      Modelica.Blocks.Interfaces.RealOutput v annotation(
        Placement(transformation(extent = {{100, -60}, {120, -40}}), iconTransformation(extent = {{100, -60}, {120, -40}})));
      Modelica.Blocks.Interfaces.RealOutput a annotation(
        Placement(transformation(extent = {{100, -80}, {120, -60}}), iconTransformation(extent = {{100, -80}, {120, -60}})));
    equation
      connect(fixed.flange, springDamper1.flange_a) annotation(
        Line(points = {{-70, 0}, {-60, 0}, {-50, 0}}, color = {0, 127, 0}));
      connect(springDamper1.flange_b, mass1.flange_a) annotation(
        Line(points = {{-30, 0}, {-22, 0}, {-14, 0}}, color = {0, 127, 0}));
      connect(mass1.flange_b, positionSensor.flange) annotation(
        Line(points = {{6, 0}, {12, 0}, {12, -30}, {20, -30}}, color = {0, 127, 0}));
      connect(mass1.flange_b, speedSensor.flange) annotation(
        Line(points = {{6, 0}, {12, 0}, {12, -50}, {20, -50}}, color = {0, 127, 0}));
      connect(mass1.flange_b, accSensor.flange) annotation(
        Line(points = {{6, 0}, {12, 0}, {12, -70}, {20, -70}}, color = {0, 127, 0}));
      connect(force.flange, mass1.flange_b) annotation(
        Line(points = {{20, 0}, {6, 0}}, color = {0, 127, 0}));
      connect(accSensor.a, a) annotation(
        Line(points = {{41, -70}, {110, -70}}, color = {0, 0, 127}));
      connect(speedSensor.v, v) annotation(
        Line(points = {{41, -50}, {110, -50}}, color = {0, 0, 127}));
      connect(positionSensor.s, s) annotation(
        Line(points = {{41, -30}, {110, -30}}, color = {0, 0, 127}));
      connect(force.f, F) annotation(
        Line(points = {{42, 0}, {110, 0}}, color = {0, 0, 127}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end System1;

    model System2
      Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) annotation(
        Placement(transformation(extent = {{80, -10}, {100, 10}})));
      Modelica.Mechanics.Translational.Components.Mass mass2(m = 1, s(fixed = true, start = 2), v(fixed = true, start = 0), L = 0) annotation(
        Placement(transformation(extent = {{20, -10}, {40, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 1e5, d = 6.3246, s_rel0 = 0) annotation(
        Placement(transformation(extent = {{50, -10}, {70, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper_coupling(c = 1e6, d = 14.1421, s_rel0 = 0) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Interfaces.RealOutput F annotation(
        Placement(transformation(extent = {{-100, -10}, {-120, 10}})));
      Modelica.Blocks.Interfaces.RealInput s annotation(
        Placement(transformation(extent = {{-120, -40}, {-100, -20}})));
      Modelica.Blocks.Interfaces.RealInput v annotation(
        Placement(transformation(extent = {{-120, -60}, {-100, -40}})));
      Modelica.Blocks.Interfaces.RealInput a annotation(
        Placement(transformation(extent = {{-120, -80}, {-100, -60}})));
      Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
        Placement(transformation(extent = {{-20, 10}, {-40, -10}})));
      Modelica.Mechanics.Translational.Sources.Move move annotation(
        Placement(transformation(extent = {{-68, -10}, {-48, 10}})));
    equation
      connect(forceSensor.f, F) annotation(
        Line(points = {{-22, 11}, {-90, 11}, {-90, 0}, {-110, 0}}, color = {0, 0, 127}));
      connect(s, move.u[1]) annotation(
        Line(points = {{-110, -30}, {-80, -30}, {-80, -1.33333}, {-70, -1.33333}}, color = {0, 0, 127}));
      connect(v, move.u[2]) annotation(
        Line(points = {{-110, -50}, {-80, -50}, {-80, 0}, {-70, 0}}, color = {0, 0, 127}));
      connect(a, move.u[3]) annotation(
        Line(points = {{-110, -70}, {-80, -70}, {-80, 1.33333}, {-70, 1.33333}}, color = {0, 0, 127}));
      connect(springDamper_coupling.flange_b, mass2.flange_a) annotation(
        Line(points = {{10, 0}, {15, 0}, {20, 0}}, color = {0, 127, 0}));
      connect(mass2.flange_b, springDamper2.flange_a) annotation(
        Line(points = {{40, 0}, {45, 0}, {50, 0}}, color = {0, 127, 0}));
      connect(springDamper2.flange_b, fixed.flange) annotation(
        Line(points = {{70, 0}, {80, 0}, {90, 0}}, color = {0, 127, 0}));
      connect(forceSensor.flange_a, springDamper_coupling.flange_a) annotation(
        Line(points = {{-20, 0}, {-15, 0}, {-10, 0}}, color = {0, 127, 0}));
      connect(move.flange, forceSensor.flange_b) annotation(
        Line(points = {{-48, 0}, {-44, 0}, {-40, 0}}, color = {0, 127, 0}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end System2;

    model CoupledSystem
      DualMassOscillator.System1 system1 annotation(
        Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
      DualMassOscillator.System2 system2 annotation(
        Placement(transformation(extent = {{10, -10}, {30, 10}})));
    equation
      connect(system2.F, system1.F) annotation(
        Line(points = {{9, 0}, {-9, 0}}, color = {0, 0, 127}));
      connect(system1.s, system2.s) annotation(
        Line(points = {{-9, -3}, {-9, -3}, {9, -3}}, color = {0, 0, 127}));
      connect(system1.v, system2.v) annotation(
        Line(points = {{-9, -5}, {-9, -5}, {9, -5}}, color = {0, 0, 127}));
      connect(system1.a, system2.a) annotation(
        Line(points = {{-9, -7}, {-9, -7}, {9, -7}}, color = {0, 0, 127}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CoupledSystem;

    model ReferenceSystem
      Modelica.Mechanics.Translational.Components.Fixed fixed(s0 = 0) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-90, 0})));
      Modelica.Mechanics.Translational.Components.Mass mass1(m = 1, s(fixed = true, start = 1), v(fixed = true, start = 0), L = 0) annotation(
        Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper1(c = 1e4, d = 2, s_rel0 = 0) annotation(
        Placement(transformation(extent = {{-70, -10}, {-50, 10}})));
      Modelica.Mechanics.Translational.Components.Fixed fixed1(s0 = 0) annotation(
        Placement(transformation(extent = {{80, -10}, {100, 10}})));
      Modelica.Mechanics.Translational.Components.Mass mass2(m = 1, s(fixed = true, start = 2), v(fixed = true, start = 0), L = 0) annotation(
        Placement(transformation(extent = {{20, -10}, {40, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper2(c = 1e5, d = 6.3246, s_rel0 = 0) annotation(
        Placement(transformation(extent = {{50, -10}, {70, 10}})));
      Modelica.Mechanics.Translational.Components.SpringDamper springDamper_coupling(c = 1e6, d = 14.1421, s_rel0 = 0) annotation(
        Placement(transformation(extent = {{-10, -10}, {10, 10}})));
    equation
      connect(fixed.flange, springDamper1.flange_a) annotation(
        Line(points = {{-90, 0}, {-80, 0}, {-70, 0}}, color = {0, 127, 0}));
      connect(springDamper1.flange_b, mass1.flange_a) annotation(
        Line(points = {{-50, 0}, {-40, 0}}, color = {0, 127, 0}));
      connect(springDamper_coupling.flange_b, mass2.flange_a) annotation(
        Line(points = {{10, 0}, {15, 0}, {20, 0}}, color = {0, 127, 0}));
      connect(mass2.flange_b, springDamper2.flange_a) annotation(
        Line(points = {{40, 0}, {45, 0}, {50, 0}}, color = {0, 127, 0}));
      connect(springDamper2.flange_b, fixed1.flange) annotation(
        Line(points = {{70, 0}, {80, 0}, {90, 0}}, color = {0, 127, 0}));
      connect(mass1.flange_b, springDamper_coupling.flange_a) annotation(
        Line(points = {{-20, 0}, {-15, 0}, {-10, 0}}, color = {0, 127, 0}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -20}, {100, 20}})),
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -20}, {100, 20}})));
    end ReferenceSystem;

    model ReferenceSystemEq
      Real s1;
      Real v1;
      Real s2;
      Real v2;
      Real F;
      parameter Real d1 = 2;
      parameter Real d2 = 6.3246;
      parameter Real dc = 14.1421;
      parameter Real c1 = 1e4;
      parameter Real c2 = 1e5;
      parameter Real cc = 1e6;
      parameter Real m1 = 1;
      parameter Real m2 = 1;
    initial equation
      s1 = 1;
      s2 = 2;
      v1 = 0;
      v2 = 0;
    equation
      der(s1) = v1;
      der(s2) = v2;
      m1 * der(v1) = (-c1 * s1) - d1 * v1 + F;
      m2 * der(v2) = (-c2 * s2) - d2 * v2 - F;
      F = (-cc * s1) - dc * v1 + cc * s2 + dc * v2;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end ReferenceSystemEq;

    model System1Eq
      Real s1 = out_s1;
      Real v1 = out_v1;
      Real F = in_F;
      parameter Real d1 = 2;
      parameter Real c1 = 1e4;
      parameter Real m1 = 1;
      Modelica.Blocks.Interfaces.RealInput in_F annotation(
        Placement(transformation(extent = {{120, -10}, {100, 10}}), iconTransformation(extent = {{120, -10}, {100, 10}})));
      Modelica.Blocks.Interfaces.RealOutput out_s1 annotation(
        Placement(transformation(extent = {{100, -40}, {120, -20}}), iconTransformation(extent = {{100, -40}, {120, -20}})));
      Modelica.Blocks.Interfaces.RealOutput out_v1 annotation(
        Placement(transformation(extent = {{100, -60}, {120, -40}}), iconTransformation(extent = {{100, -60}, {120, -40}})));
    initial equation
      s1 = 1;
      v1 = 0;
    equation
      der(s1) = v1;
      m1 * der(v1) = (-c1 * s1) - d1 * v1 + F;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end System1Eq;

    model System2Eq
      Real s1 = in_s1;
      Real v1 = in_v1;
      Real s2;
      Real v2;
      Real F = out_F;
      parameter Real d2 = 6.3246;
      parameter Real dc = 14.1421;
      parameter Real c2 = 1e5;
      parameter Real cc = 1e6;
      parameter Real m2 = 1;
      Modelica.Blocks.Interfaces.RealOutput out_F annotation(
        Placement(transformation(extent = {{-100, -10}, {-120, 10}})));
      Modelica.Blocks.Interfaces.RealInput in_s1 annotation(
        Placement(transformation(extent = {{-120, -40}, {-100, -20}})));
      Modelica.Blocks.Interfaces.RealInput in_v1 annotation(
        Placement(transformation(extent = {{-120, -60}, {-100, -40}})));
    initial equation
      s2 = 2;
      v2 = 0;
    equation
      der(s2) = v2;
      m2 * der(v2) = (-c2 * s2) - d2 * v2 - F;
      F = (-cc * s1) - dc * v1 + cc * s2 + dc * v2;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end System2Eq;

    model CoupledSystemEq
      DualMassOscillator.System1Eq system1Eq annotation(
        Placement(transformation(extent = {{-30, -10}, {-10, 10}})));
      DualMassOscillator.System2Eq system2Eq annotation(
        Placement(transformation(extent = {{10, -10}, {30, 10}})));
    equation
      connect(system1Eq.in_F, system2Eq.out_F) annotation(
        Line(points = {{-9, 0}, {9, 0}, {9, 0}}, color = {0, 0, 127}));
      connect(system1Eq.out_s1, system2Eq.in_s1) annotation(
        Line(points = {{-9, -3}, {-0.5, -3}, {-0.5, -3}, {9, -3}}, color = {0, 0, 127}));
      connect(system1Eq.out_v1, system2Eq.in_v1) annotation(
        Line(points = {{-9, -5}, {-0.5, -5}, {-0.5, -5}, {9, -5}}, color = {0, 0, 127}));
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)));
    end CoupledSystemEq;
  end DualMassOscillator;
  annotation(
    uses(Modelica(version = "3.2.2")));
end MultiMassOscillator;