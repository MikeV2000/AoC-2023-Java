import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Main {
  public static void main(String[] args) {
    try (Stream<String> stream = Files.lines(Paths.get("input.txt"))) {
      System.out.println(stream.mapToInt(line -> getIntFromString(line)).sum());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  private static int getIntFromString(String string) {
    // Get the first integer
    char firstInt = 0;
    for (int i = 0; i < string.length(); i++) {
      if (Character.isDigit(string.charAt(i))) {
        firstInt = string.charAt(i);
        break;
      }
    }

    // Get the last integer
    char lastInt = 0;
    for (int i = string.length() - 1; i >= 0; i--) {
      if (Character.isDigit(string.charAt(i))) {
        lastInt = string.charAt(i);
        break;
      }
    }

    return Integer.parseInt("" + firstInt + lastInt);
  }
}
