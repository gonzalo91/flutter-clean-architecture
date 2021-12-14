abstract class HttpClient{

    Future get(String url, Object data);

    Future post(String url, Object data);

}