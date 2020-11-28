<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Results</title>
      </head>
      <body>
        <xsl:choose>
          <xsl:when test="hash">
            <p>
              <xsl:value-of select="hash/message"/>
            </p>
          </xsl:when>
          <xsl:otherwise>
            <table class="table table-bordered">
              <tr>
                <td>Greatest common factor</td>
                <td>Least common multiply</td>
              </tr>
              <tr>
                <td>
                  <xsl:value-of select="objects/object/gcf"/>
                </td>
                <td>
                  <xsl:value-of select="objects/object/lcm"/>
                </td>
              </tr>
              <tr>
                <td colspan="2">Iterations</td>
              </tr>
              <tr>
                <td>First number</td>
                <td>Second number</td>
              </tr>
              <xsl:for-each select="objects/object">
                <xsl:if test="first">
                  <tr>
                    <td>
                      <xsl:value-of select="first"/>
                    </td>
                    <td>
                      <xsl:value-of select="second"/>
                    </td>
                  </tr>
                </xsl:if>
              </xsl:for-each>
            </table>
          </xsl:otherwise>
        </xsl:choose>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>