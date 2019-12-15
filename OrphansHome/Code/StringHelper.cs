namespace OrphansHome
{
    internal class StringHelper
    {
        public static string Truncate(string str, char c)
        {
            return str.Substring(0, str.IndexOf(c));
        }
        public static string Truncate(string str, int c)
        {
            return str.Substring(0, c);
        }
    }
}