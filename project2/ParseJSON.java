import java.io.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ParseJSON {
  public static void main(String[] args) throws Exception {
    // Read the given json file and parse it using JSONParser
    JSONParser parser = new JSONParser();
    JSONObject jsonObject = (JSONObject)parser.parse(new FileReader("data/simplewiki-abstract.json"));

    // Once we have the JSONObject, we can access the different fields by using the 'get' method.
    // The 'get' method returns a value of type Object. We must cast the returned value to the correct type.
    JSONObject simplewiki = (JSONObject)jsonObject.get("simplewiki");
    JSONArray pages = (JSONArray)simplewiki.get("page");

    //Create a file that contains the documents in a format that can be indexed using the Elasticsearch bulk API.
    PrintWriter writer = new PrintWriter("data/out.txt", "UTF-8");

    // preprocess the json file and output an command txt for elasticsearch
    int id = 1;
    for(Object page : pages) {
      // add an id for each page
      String header = "{\"index\": {\"_id\": \"" + String.valueOf(id) + "\" }}";

      // write result to output file
      writer.println(header);
      writer.println(page);
      writer.println();
      id ++;
    }

    writer.close();
  }
}
