<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" indent="yes" />
  <xsl:template match="/">
  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
  <html>
  <head>
    <title>Directory listing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/.static/style.css" />
  </head>
  <body>
    <h1>Index of</h1>
    <table>
    <thead>
      <tr>
        <th>Name</th>
        <th style="text-align:right;">Size</th>
        <th style="text-align:right">Date</th>
      </tr>
    </thead>
    <tbody>
      <xsl:for-each select="list/*">
        <xsl:variable name="url">
          <xsl:value-of select="."/>
          <xsl:if test="name() = 'directory'">/</xsl:if>
        </xsl:variable>
        <xsl:variable name="size">
          <xsl:if test="string-length(@size) &gt; 0">
            <xsl:if test="number(@size) &gt; 0">
              <xsl:choose>
                <xsl:when test="round(@size div 1024) &lt; 1"><xsl:value-of select="@size" />B</xsl:when>
                <xsl:when test="round(@size div 1048576) &lt; 1"><xsl:value-of select="format-number((@size div 1024), '0.0')" />K</xsl:when>
                <xsl:otherwise><xsl:value-of select="format-number((@size div 1048576), '0.00')" />M</xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:if>
        </xsl:variable>
        <xsl:variable name="date">
          <xsl:value-of select="substring(@mtime,1,10)"/>
        </xsl:variable>
        <xsl:variable name="time">
          <xsl:value-of select="substring(@mtime,12,8)"/>
        </xsl:variable>

        <tr>
          <td><a href="{$url}"><xsl:value-of select="$url"/></a></td>
          <td style="text-align:right"><xsl:value-of select="$size"/></td>
          <td style="text-align:right">
            <xsl:value-of select="$date"/>
            <span class="time">
              <xsl:text> </xsl:text>
              <xsl:value-of select="$time" />
            </span>
          </td>
        </tr>
      </xsl:for-each>
    </tbody>
    </table>
  </body>
  </html>
  </xsl:template>
</xsl:stylesheet>
