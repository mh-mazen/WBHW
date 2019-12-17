using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace OrphansHome.Code
{
    public class FileHelper
    {
        public static string UpdateImage(HttpPostedFile file, string path)
        {
            var pathNew = "";
            if (File.Exists(path))
            {
                File.Delete(path);
                pathNew = path;
            }
            else
            {
                FileInfo[] files = new DirectoryInfo(path).GetFiles("*");
                if (files.Count() > 0)
                    pathNew = path + "ORF-" + ((int.Parse(StringHelper.Truncate(Path.GetFileNameWithoutExtension(files[files.Count() - 1].Name), '.') + 1))) + ".jpg";
                else
                    pathNew = path + "ORF-1.jpg";
            }
            using (var fileStream = File.Create(pathNew))
            {
                file.InputStream.Seek(0, SeekOrigin.Begin);
                file.InputStream.CopyTo(fileStream);
            }
            return pathNew;
        }
    }
}