import java.net.*;
import java.io.*;

public class GetWebpage {
    public static void main(String args[]) throws Exception {
        try {
            // get the url to achive data
            String url = args[0];

            // open an url connection
            URLConnection connection = new URL(url).openConnection();

            // use a stream reader and buffer reader to read data from previous url connection
            InputStreamReader reader = new InputStreamReader(connection.getInputStream());
            BufferedReader buffer = new BufferedReader(reader);

            // save each line of html page to result data
            String data = "";
            String line;
            while ((line = buffer.readLine()) != null) {
                data = data + line + '\n';
            }
            buffer.close();

            // print data out
            System.out.print(data);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
