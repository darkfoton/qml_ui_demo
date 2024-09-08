#ifndef APPLICATIONMODEL_H
#define APPLICATIONMODEL_H

#include <QQuickItem>
#include "parameterslistmodel.h"

class ApplicationModel : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(bool leftPanelVisible READ leftPanelVisible WRITE setLeftPanelVisible NOTIFY leftPanelVisibleChanged FINAL)
    Q_PROPERTY(bool rightPanelVisible READ rightPanelVisible WRITE setRightPanelVisible NOTIFY rightPanelVisibleChanged FINAL)
    Q_PROPERTY(QAbstractListModel* parametersList READ parametersList NOTIFY parametersListChanged FINAL)
    Q_PROPERTY(double maxValue READ maxValue NOTIFY maxValueChanged FINAL)
    QML_ELEMENT
public:
    ApplicationModel();

    QAbstractListModel* parametersList();

    bool leftPanelVisible() const;
    bool rightPanelVisible() const;
    double maxValue() const;

    void setLeftPanelVisible(bool value);
    void setRightPanelVisible(bool value);
    void setMaxValue(double value);

public slots:
    void onMaxValueChanged(double value);

signals:
    void leftPanelVisibleChanged();
    void rightPanelVisibleChanged();
    void parametersListChanged();
    void maxValueChanged();

private:
    bool m_leftPanelVisible;
    bool m_rightPanelVisible;
    double m_maxValue;
    ParametersListModel m_parametersList;
};

#endif // APPLICATIONMODEL_H
