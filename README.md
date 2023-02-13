
## Lessons Learned

- Inheritance (dark mode and light mode inherted from ThemeData class).

- How to handle different modes colors 
   in calculator/lib/assets/theme_data.dart
   you will find 3 classes

- parent class
    
    **store object from parent(ModeData) in provider since the whole application's colors changes from dark to light not only primary and secondary color**
    

    **when user change mode this object will change in setting provider  ModeData currentThemeData = DarkModeData();**

    **if you try to store darkThemeData() then replace that value to LightModeData() you will get an error because the variable currentThemeData already took darkThemeData type**

    *the solution is Inheritance*

- parent

      class ModeData {
      var basicOperationsColor ;
      var normalButtonColor;
      ModeData({
          required this.basicOperations,
          required this.normalButton }
                );}

- Children

         class DarkModeData extends ModeData {
            DarkModeData(): super(
            basicOperations: const Color(0xff49335c)
            normalButton: const Color(0xff404245),
           );
        }

        class LightModeData extends ModeData {
            LightModeData(): super(
            basicOperations: const Color(0xffe1d5e9)
            normalButton: const Color(0xfff3f5f7),
           );
        }

